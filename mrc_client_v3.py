#!/usr/bin/python
# ::::: __________________________________________________________________ :::::
# : ____\ ._ ____ _____ __. ____ ___ _______ .__ ______ .__ _____ .__ _. /____ :
# __\ .___! _\__/__    / _|__   / _/_____  __|  \ gRK __|_ \  __  |_ \ !___. /__
# \   ! ___/  |/  /___/  |   \__\ ._/  __\/  \   \___/  |/  \/  \_./  \___ !   /
# /__  (___   /\____\____|\   ____|   /  /___|\   ______.    ____\|\   ___)  __\
#   /____  \_/ ___________ \_/ __ |__/ _______ \_/ ____ |___/ _____ \_/  ____\
# :     /________________________________________________________________\     :
# :::::       +  p  H  E  N  O  M  p  R  O  D  U  C  T  I  O  N  S  +      :::::
# ==============================================================================
#
# -----------------------------------------
# - modName: mrc_client multiplexer       -
# - majorVersion: 1.2                     -
# - minorVersion: 9                       -
# - author: Stackfault                    -
# - publisher: Phenom Productions         -
# - website: https://www.phenomprod.com   -
# - email: stackfault@bottomlessabyss.net -
# - bbs: bbs.bottomlessabyss.net:2023     -
# -----------------------------------------
#
# Based on previous work from Gryphon of Cyberia BBS
#
# The code have been completely reviewed and improved everywhere I could see
# room for improvement without breaking compatibility.
#
# Major changes:
#
# v1.2.5
#
# - Error trapping on all critical locations
# - Socket routine rewrite and now non-blocking
# - Internal auto-restart, no need for an external restart script
# - New commands added and supported by the new server code
# - Message serialization allowing very fast message rate and proper display order
# - Bonus server stats data allowing an in-bbs applet to show MRC status (See samples)
# - Graceful client shutdown notification to the server
# - New BBS information subsystem allowing BBS to provide connection info details
# - New startup check to allow for smoother installation and configuration
#
# v1.2.7
#
# - Update available/Client too old notifications and validation
# - Client latency reporting
# - Added support for upcoming server activity level stats
# - Increase both frequency and tolerance of stats reporting
# - Other smaller fixes
#
# v1.2.9
# - Improved handling of incomplete and invalid packets
# - Implemented client stats transfer
# - Increased tcp buffer size
# - Improved the stats reporting
# - Rebased the message serialization
#
# v1.2.9a
# - Add room to chat log [mL]
#
# Make sure to use the new mrc_config.py so you can take advantage of some new
# features.
#

import os, os.path, sys, fnmatch, glob, re, ssl
import time, socket, errno, string, platform, traceback

import mrc_client_encryption

# Import site config
from mrc_config import *

msleep = lambda x: time.sleep(x/1000.0)
bbsdir = os.getcwd()

# Change this info
tempdir  = "%s%stemp"      % (bbsdir,  os.sep)
datadir  = "%s%sdata"      % (bbsdir,  os.sep)
chatdats = "%s%schat*.dat" % (datadir, os.sep)

# Align this path with the MRC MPL (Default: {mrcdatadir}/mrc)
mrcdir   = "%s%smrc"       % (datadir, os.sep)

# Platform information
version        = "1.3.0a"
platform_name  = "MYSTIC"
system_name    = platform.system()
machine_arch   = platform.machine()
debugflag      = True
version_string = "%s/%s.%s/%s" % (platform_name, system_name, machine_arch, version)
client_version = "Multi Relay Chat Client v%s [mL] (with encryption!)" % version

# Check for command-line args
if(len(sys.argv) < 3) :
    print "Usage : mrc_client.py hostname port"
    sys.exit(1)

# Global vars
host     = sys.argv[1]
port     = int(sys.argv[2])
intv     = [1, 2, 5, 10, 30, 60, 120, 180, 240, 300]   # Auto-restart intervals
timebase = int(time.time())
registry = {}
mrcstats = ''

# Strip MCI color codes
def stripmci(text):
    return re.sub('\|[0-9]{2}', '', text)

# Sat Feb  6 16:55:18 2021  IN: SERVER~~~MeaTLoTioN~~a789653hgjk3876yhuk~ROOMTOPIC:a789653hgjk3876yhuk:test~
# Sat Aug 27 23:37:50 2022  IN: SERVER~~~MeaTLoTioN~~testing~ROOMTOPIC:testing:test~
# User chatlog for DLCHATLOG
def chatlog(data):
    if "CLIENT~" not in data and "SERVER~" not in data:
        ltime=time.asctime(time.localtime(time.time()))
        packet   = data.split("~")
        if packet[5]:
          room   = packet[5]
        else:
          room   = packet[2]
        message  = stripmci(packet[6])
        clogfile = "%s%smrcchat.log" % (mrcdir, os.sep)
        clog     = open(clogfile, "a")
        clog.write("%s %s %s\n" % (ltime, room, message))
        clog.close()

    if 'ROOMTOPIC' in data:
        ltime=time.asctime(time.localtime(time.time()))
        packet   = data.split("~")
        if packet[5]:
          room   = packet[5]
        else:
          room   = packet[2]
        message  = stripmci(packet[6])
        newTopic = message.split(':')[2]
        clogfile = "%s%smrcchat.log" % (mrcdir, os.sep)
        clog     = open(clogfile, "a")
        clog.write("%s %s %s\n" % (ltime, room, message))
        clog.close()


    ltime=time.asctime(time.localtime(time.time()))
    packet   = data.split("~")
    if packet[5]:
      room   = packet[5]
    else:
      room   = packet[2]
    message  = stripmci(packet[6])
    #if room == 'testing':
    #    clogfile = "%s%smrcchat.log" % (mrcdir, os.sep)
    #    clog     = open(clogfile, "a")
    #    clog.write("%s %s %s\n" % (ltime, room, message))
    #    clog.close()

# Console logger
def logger(loginfo):
  ltime = time.asctime(time.localtime(time.time()))
  print "%s  %s" % (ltime, loginfo.strip())
  sys.stdout.flush()

# Socket sender to server
def send_server(data):
    global registry
    if data:
        try:
            regstp = int(time.time()*1000)
            regstr = data.strip()
            registry[regstr] = regstp
            mrcserver.send(data)
        except:
            logger("Connection error")
            try:
                mrcserver.shutdown(2)
            except:
                pass
            finally:
                mrcserver.close()

# Temp files cleaning routine
def clean_files():
    mrcfiles = os.listdir( mrcdir )
    for file in mrcfiles:
        if fnmatch.fnmatch(file,'*.mrc'):
            mrcfile = "%s%s%s" % (mrcdir,os.sep,file)
            os.remove(mrcfile)

# Read queued file from MRC, ignoring stale files older than 10s
def send_mrc():
    mrcfiles = os.listdir( mrcdir )
    for file in mrcfiles:
        if fnmatch.fnmatch(file,'*.mrc'):
            mrcfile = "%s%s%s" % (mrcdir,os.sep,file)
            ft = os.path.getmtime(mrcfile)

            # Do not forward packets older than 10s
            if time.time() - ft < 10:
                try:
                    # Avoid reading a file still open by the MPL by
                    # opening it read-write to check for locking
                    f  = open(mrcfile,"r+")
                    fl = f.readline()
                    f.close()

                    if fl.count("~") > 5:
                        mline    = fl.split("~")
                        fromuser = mline[0]
                        frombbs  = mline[1]
                        touser   = mline[3]
                        message  = mline[6]

                        if message == "VERSION":
                            deliver_mrc("CLIENT~~~%s~%s~~|07- %s~" % (fromuser, frombbs, client_version))
                            send_server(fl)

                        elif touser == "CLIENT" and message == "LATENCY":
                            deliver_mrc("SERVER~~~CLIENT~%s~~LATENCY:%s~" % (frombbs, latency))

                        elif touser == "CLIENT" and message == "STATS":
                            deliver_mrc("SERVER~~~CLIENT~%s~~STATS:%s~" % (frombbs, mrcstats))

                        else:
                            # Encrypt message
                            new_fl = mrc_client_encryption.encrypt_message(fl)
                            send_server(new_fl)

                        if debugflag:
                            logger("OUT: %s" % fl)
                        os.remove(mrcfile)
                    else:
                        if debugflag:
                            logger("File %s contains invalid packet" % mrcfile)

                except IOError:
                    if debugflag:
                        logger("MRC file still busy")
                    pass
                except:
                    if debugflag:
                        logger("Error:" + traceback.print_exc())
            else:
                os.remove(mrcfile)

# Write time serialized file for display in MRC
def deliver_mrc( server_data ):
    global registry
    global latency
    global mrcstats
    global timebase

    curtime = int(time.time()*1000)
    if server_data.strip() in registry.keys():
        pkttime   = int(registry[server_data.strip()]) 
        roundtrip = curtime - pkttime
        if roundtrip > 1: 
            latency = roundtrip
            if debugflag:
                logger("LATENCY: Current: %s - Packet: %s = RoundTrip: %s" % (curtime, pkttime, roundtrip))
        registry.clear()

    # Make up a serialized filename based on time
    fileserial = int((time.time()-timebase) * 1000)

    # Wrap the file serial if longer than 8 chars
    if fileserial > 99999999:
        timebase   = int(time.time())
        fileserial = int((time.time()-timebase) * 1000)
    # Zeropad the filename
    filename = "%08d.mrc" % fileserial

    try:
        packet   = server_data.split("~")
        fromuser = packet[0]
        fromsite = packet[1]
        fromroom = packet[2]
        touser   = packet[3]
        tosite   = packet[4]
        toroom   = packet[5]
        message  = packet[6]
    except:
        logger("Bad packet: %s" % server_data)
        return

    if debugflag: logger("IN: %s" % server_data)

    # Manage server PINGs
    if fromuser == "SERVER" and message.lower() == "ping":
        send_im_alive()

    # Manage update available notifications
    elif fromuser == "SERVER" and message.startswith("NEWUPDATE:"):
        logger("Upgrade is available, consider upgrading at your earliest convenience")
        logger("You are using version %s" % version)
        logger("Latest version is %s" % message.split(":")[1])

    # Manage old clients
    elif fromuser == "SERVER" and message.startswith("OLDVERSION:"):
        logger("Your client is too old and can no longer be used.")
        logger("You are using version %s" % version)
        logger("Latest version is %s" % message.split(":")[1])
        raise KeyboardInterrupt

    #elif fromuser == "SERVER" and message.startswith("ROOMTOPIC:"):
    #    ltime=time.asctime(time.localtime(time.time()))
    #    MM    = message.split(":")
    #    room  = MM[1]
    #    topic = MM[2]
    #    clogfile = "%s%smrcchat.log" % (mrcdir, os.sep)
    #    clog     = open(clogfile, "a")
    #    clog.write("%s %s %s\n" % (ltime, "NEWTOPIC{" + room + "}", topic))
    #    clog.close()
    
    else:

        # Manage server stats
        if fromuser == "SERVER" and message.startswith("STATS:"):
            statsfile = "%s%smrcstats.dat" % (mrcdir, os.sep)
            try:
                f = open(statsfile, "w")
                f.write(message.split(":")[1])
                f.close()
                mrcstats = message.split(":")[1]
            except:
                logger("Cannot write server stats to %s" % statsfile)
        
        chatlog(server_data)

        if fromuser != 'SERVER':
            # Decrypt messages
            server_data = mrc_client_encryption.decrypt_message(server_data)

        for f in glob.iglob(chatdats):
            if not 'chatroom' in f:
                chatfile="%s%schat" % (datadir,os.sep)
                xy = f.replace(chatfile,tempdir)
                xy = xy[:-4]
                inusefile = "%s%stchat.inuse" % (xy,os.sep)
                if os.path.isfile(inusefile):
                    mrcfile  = "%s%s%s" % (xy,os.sep,filename)
                    openfile = open(mrcfile,"a")
                    openfile.write(server_data)
                    openfile.close()
                    msleep(5)

# Respond to server PING
def send_im_alive():
    data = "CLIENT~%s~~SERVER~~~IMALIVE:%s~\n" % (bbsname,bbsname)
    send_server(data)

# Send graceful shutdown request to server when exited
def send_shutdown():
    data = "CLIENT~%s~~SERVER~~~SHUTDOWN~\n" % bbsname
    send_server(data)

# Request server stats for applet
def request_stats():
    data = "CLIENT~%s~~SERVER~~~STATS~\n" % bbsname
    send_server(data)

# Send BBS additional info for INFO command
def send_bbsinfo():
    prefix  = "CLIENT~%s~~SERVER~ALL~~" % bbsname
    packet  = prefix + "INFOWEB:%s~\n"  % info_web
    packet += prefix + "INFOTEL:%s~\n"   % info_telnet
    packet += prefix + "INFOSSH:%s~\n"   % info_ssh
    packet += prefix + "INFOSYS:%s~\n"   % info_sysop
    packet += prefix + "INFODSC:%s~\n"   % info_desc
    send_server(packet)

# Handle different line separator scenarios
def check_separator(data):
    if   data.count("\r\n"): return("\r\n")
    elif data.count("\n\r"): return("\n\r")
    elif data.count("\r"):   return("\r")
    else:                    return("\n")

# Main process loop
def mainproc():
    global delay
    global mrcserver
    global latency

    mrcserver = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    mrcserver.settimeout(5)

    restart    = 0
    readbuffer = ''
    tdat       = ''
    latency    = 0

    # Non-blocking socket loop to improve speed
    try:
        mrcserver.connect((host, port))
        mrcserver.setblocking(0)
        mrcserver.send("%s~%s" % (bbsname, version_string))
        logger("Connected to Multi Relay Chat host %s port %d" % (host, port))
        delay = 0
    except:
        logger("Unable to connect to %s:%d" % (host,port))
        return

    send_bbsinfo()
    send_im_alive()

    loop = 1800
    while True:
        msleep(10)
        send_mrc()

        loop += 1
        try:
            readbuffer = mrcserver.recv(8192)
        except socket.error, e:
            err = e.args[0]
            if err == errno.EAGAIN or err == errno.EWOULDBLOCK:
                # Request stats every 20 seconds
                if loop > 2000:
                    request_stats()
                    loop = 0
                continue
            else:
                restart = 1
        else:
            if readbuffer:
                sep  = check_separator(readbuffer)
                tdat = readbuffer.split(sep)
                for data in tdat:
                    if data:
                        deliver_mrc(data)
            else:
                restart = 1

        # Handle socket restarts with socket shutdowns
        if restart:
            logger("Lost connection to server\n")
            try:
                mrcserver.shutdown(2)
            finally:
                mrcserver.close()
            return

# Some validation of config to ensure smoother operation
def check_startup():
    failed = 0

    if not os.path.exists(mrcdir):
        os.makedirs(mrcdir)

    if len(stripmci(bbsname)) < 5:
        print "Config: 'bbsname' should be set to something sensible"
        failed = 1

    if len(stripmci(bbsname)) > 40:
        print "Config: 'bbsname' cannot be longer than 40 characters after PIPE codes evaluation"
        failed = 1

    for param in ['info_web' 'info_telnet', 'info_ssh', 'info_sysop', 'info_desc']:
        if len(stripmci(param)) > 64:
            print "Config: '%s' cannot be longer than 64 characters after PIPE codes evaluation" % param
            failed = 1

    for param in ['info_web' 'info_telnet', 'info_ssh', 'info_sysop', 'info_desc']:
        if len(param) > 128:
            print "Config: '%s' cannot be longer than 128 characters including PIPE codes" % param
            failed = 1

    if failed:
        print "This must be fixed in mrc_config.py"
        sys.exit()

# Main loop
if __name__ == "__main__":
    logger(client_version)
    check_startup()
    delay = 0
    while True:
        try:
            mainproc()

            # Incremental auto-restart built-in
            logger("Reconnecting in %d seconds" % intv[delay])
            time.sleep(intv[delay])
            delay += 1
            if delay > 9: delay = 0

        except KeyboardInterrupt:
            logger("Shutting down")
            try:
                send_shutdown()
                try:
                    mrcserver.shutdown(2)
                except:
                    pass
            finally:
                mrcserver.close()
            sys.exit()
        except:
            continue

