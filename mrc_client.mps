/// ::::: __________________________________________________________________ :::::
// : ____\ ._ ____ _____ __. ____ ___ _______ .__ ______ .__ _____ .__ _. /____ :
// __\ .___! _\__/__    / _|__   / _/_____  __|  \ gRK __|_ \  __  |_ \ !___. /__
// \   ! ___/  |/  /___/  |   \__\ ._/  __\/  \   \___/  |/  \/  \_./  \___ !   /
// /__  (___   /\____\____|\   ____|   /  /___|\   ______.    ____\|\   ___)  __\
//   /____  \_/ ___________ \_/ __ |__/ _______ \_/ ____ |___/ _____ \_/  ____\
// :     /________________________________________________________________\     :
// :::::       +  p  H  E  N  O  M  p  R  O  D  U  C  T  I  O  N  S  +      :::::
// ==============================================================================
//
// -----------------------------------------
// - modName: MRC Mystic Client            -
// - majorVersion: 1.2                     -
// - minorVersion: 9a                      -
// - author: Stackfault                    -
// - publisher: Phenom Productions         -
// - website: https://www.phenomprod.com   -
// - email: stackfault@bottomlessabyss.net -
// - bbs: bbs.bottomlessabyss.net:2023     -
// -----------------------------------------
//
// Update history
//
// Version 1.1    - Gryphon // Cyberia BBS
// Version 1.1.4  - Stackfault [sf] <phENom> // The Bottomless Abyss
// Version 1.2.5  - Stackfault [sf] <phENom> // The Bottomless Abyss
// Version 1.2.7  - Stackfault [sf] <phENom> // The Bottomless Abyss
// Version 1.2.9  - Stackfault [sf] <phENom> // The Bottomless Abyss
// Version 1.2.9a - Stackfault [sf] <phENom> // The Bottomless Abyss
// Version 1.2.9b - MeaTLoTioN [mL] <grAvY>  // The Quantum Wormhole
// Version 1.2.9c - MeaTLoTioN [mL] <grAvY>  // The Quantum Wormhole
// Version 1.2.9d - MeaTLoTioN [mL] <grAvY>  // The Quantum Wormhole
// Version 1.2.9e - MeaTLoTioN [mL] <grAvY>  // The Quantum Wormhole
// Version 1.2.9f - MeaTLoTioN [mL] <grAvY>  // The Quantum Wormhole
// Version 1.2.9g - MeaTLoTioN [mL] <grAvY>  // The Quantum Wormhole
//
// List of changes/fixes:
//
// v1.1.4
// - Input buffer is now unblocking, you can see received chats while typing
// - Input buffer length is maxed, with color coded character counter
// - Input buffer history still available with UP/DOWN arrow keys
// - Fixed a race condition when line cannot be word wrapped
// - Added CPU release in each loops
// - Visible heartbeat animation when server refresh is active
// - Improved responsiveness and buffer refresh rate
// - Enlarged view port, now using the full 24 lines screen height
// - Now shows connected chatters when logging in
// - Welcome text at connection
// - New /changes command
// - 100% compatible with current MRC server implementation
// - Various small fixes
// - Implemented command whitelisting around pipe codes
// - Implemented colors live switching with PgUp/PgDn
// - Implemented timestamp highlighting on nick mention
// - Various validation of string input and length checking
// - Show private message when sent
// - Changed mention indicator to better support present/absent clock
// - Change wrapping on multiline chats to better use available screen space
// - Added information scroller
//
// v1.2.5
// - Added message queuing serialization
// - Added multi-line packet handling
// - Updated scrolling ticker behavior
// - Added new server commands support
// - Stale queue indicator (heartbeat change color)
// - User now marked as unavailable for node message when in MRC
// - Increased topic to 55 chars
// - Added file-locking check via exclusive open
// - Tilde character handling
// - Nick autocomplete
// - Fixed and optimized clear screen
// - Many other smaller changes
// - Small issues fixed and code cleanup
//
// v1.2.7 (Hotfix release)
// - Server banner support
// - Several fixes
// - Client/Server latency display
// - Changes scroller/banner behavior
//
// v1.2.9 (Hotfix release)
// - Topic can now contain colon
// - Addressed some bleeding in banners
// - Added server hello/iamhere dialog support
// - Fixed screen update for some calls
// - Fixed issue with userlist server refresh
// - Fixed issue with server-side banners
// - Added server stats in scrolling banner
// - Reply to last received private message using /r
// - Word-wrapping routine redone to support long strings
// - Updated skin to be more intuitive re latency, buffer, etc
// - Redone the formatting of the /SET features display
// - Added missing /SET command to code
// - Converted all loop timing events to prime numbers to avoid collisions
// - Addressed the cause for random crash
//
// v1.2.9a (Hotfix release)
// - Fixed scroller issues with some OS/Architecture combinations
// - Added support for scroller background color in customization block
// - Added an easter surprise
//
// v1.2.9b (Text Themes addition) [mL]
// - Added two new text themes; /kewl /leet
// - /kewl: aBCDeFGHiJKLMNoPQRSTuVWXYZ
// - /leet: 4BCD3FGH1JK1MN0PQR57UVWXYZ
//
// v1.2.9c (Text Themes addition) [mL]
// - Added a new text themes; /jumble
// - /jumble: This basically scrambles each word as if the computer had dyslexia
//
// v1.2.9d (Text Themes addition) [mL]
// - Added a new text themes; /rot13
// - /rot13: This basically uses the Rot13 cipher to scramble each word or unscramble
//
// v1.2.9e (qUAntUm RaDio! Now and Next display) [mL]
// - Added /qrstat to show what's playing now and next on qUAntUm RaDio!
//
// v1.2.9f (Making a private message more obvious) [mL]
// - When sending a private message using either /m /msg /t or /r the input
// - bar will turn red with white text so you know that you're typing a private
// - message and not a public message.
//
// v1.2.9g (Making a broadcast message more obvious) [mL]
// - When sending a broadcast message using /b the input bar will now turn
// - green with white text so you know that you're typing a broadcast message.
//
//  *************************************************************************
//  *   Starting with this release, only the current and previous version   *
//  *   of the client will be able to connect to the server, make sure      *
//  *   to keep your installation updated.                                   *
//  *************************************************************************
//
//                     Installation instructions
//
//      MRC Central server has relocated, please use the address below.
//   ====================================================================
//                mrc.bottomlessabyss.net on port 5000
//   ====================================================================
//
// - This release if distributed as a complete installation, including
//   both the mrc_client.py and mrc_client.mps.
// - Make sure you update both to benefit all the changes.
// - Some customization variables added, specifically around input bar
//

Uses Cfg
Uses User

Const MRCVersion = 'Multi Relay Chat MPL    v1.2.9g [mL]'
Const CLBuffer   = 25
Const InputSize  = 255
Const MaxBuffer  = 140  // Max input buffer limit [sf]

Type MRCRec  = Record
    FromUser : String[30]
    FromSite : String[30]
    FromRoom : String[30]
    ToUser   : String[30]
    ToSite   : String[30]
    ToRoom   : String[30]
    Message  : String[InputSize]
End

Type UserRec      = Record
    RecIdx        : Integer
    PermIdx       : Integer
    EnterChatMe   : String[80]
    EnterChatRoom : String[80]
    EnterRoomMe   : String[80]
    EnterRoomRoom : String[80]
    LeaveChatMe   : String[80]
    LeaveChatRoom : String[80]
    LeaveRoomMe   : String[80]
    LeaveRoomRoom : String[80]
    Name          : String[80]
    DefaultRoom   : String[80]
    Temp1         : String[80]
    Temp5         : String[80]
    Temp6         : String[80]
    Temp7         : String[80]
    NameColor     : String[16]
    LtBracket     : String[16]
    RtBracket     : String[16]
    UseClock      : Boolean
    ClockFormat   : Boolean
    ShowSmilies   : Boolean
End

Var Plyr          : UserRec
Var WinTL, WinTT  : Byte = 0
Var WinBL, WinBB  : Byte = 0

Var ChatLines       : Array [1..CLBuffer] of String[160]
Var WinAttr         : Byte = 0
Var WinSize         : Integer = 0
Var PromptX         : Byte = 0
Var PromptY         : Byte = 0
Var PromptAttr      : Byte = 0
Var RoomX, RoomY    : Byte = 0
Var RoomAttr        : Byte = 0
Var TopicX, TopicY  : Byte = 0
Var TopicAttr       : Byte = 0
Var MyNamePrompt    : String = ''
Var MyChatRoom      : Integer = 1
Var Loop            : Integer = 1
Var SiteTag         : String = ''
Var UserTag         : String = ''
Var MyRoom          : String = ''
Var MyTopic         : String = ''
Var ServFile        : MRCRec
Var BBSTempStub     : String = ''
Var ChatLog         : String = ''
Var PInUse          : String = ''
Var Scroller        : String = ''
Var UserFile        : String = JustPath(Progname)+'mrcusers.dat'
Var ChatSeed        : Integer = 0
Var NodeMsgFlag     : Boolean = False
Var BufferHist      : Array [1..10] of String [160]  // Buffer history [sf]
Var BannerList      : Array [1..20] of String [160]  // Header banners [sf]
Var BannerOff       : Byte = 0    // Banner scrolling offset [sf]
Var BanIdx          : Byte = 1    // Banner index [sf]
Var ScrollWait      : Byte = 0    // Banner scrolling wait [sf]
Var HBClr           : Byte = 11   // Color of Heartbeat [sf]
Var RoomUsers       : String = '' // Comma delimited user list [sf]
Var UserIdx         : Byte = 1    // Index of UserList search [sf]
Var LastUSearch     : String = '' // Last user search string [sf]
Var LastPrivMsg     : String = '' // Last private message received [sf]
Var Latency         : Integer = 0 // Network latency in ms [sf]
Var MRCStats        : String = '' // MRC Stats string [sf]
Var RefreshChat     : Boolean = False
Var IMaxBuffer      : Byte = MaxBuffer

// Align this path with the Python client config [sf]
// Default: mystic/data/mrc
Var SvrQueuePath    : String = CfgDataPath + 'mrc'

//
// Beginning of customization variables block [CUST]
//

Var LatencyColor    : String = '[1;32m' // Default color of latency indicator [ml]
Var RoomUsersColor  : String = '[1;33m' // Default color of roomusers indicator [ml]

// Heartbeat animation sequence [sf]
Var Heartbeat     : String = Chr(176) + Chr(177) + Chr(178) + Chr(219) + Chr(178) + Chr(177)

Var HeartbeatX    : Byte = 76              // X position of HeartBeat [sf]
Var HeartbeatY    : Byte = 23              // Y position of HeartBeat [sf]
Var HeartbeatGood : Byte = 10              // Color of HeartBeat when local queue is flowing [sf]
Var HeartbeatBad  : Byte = 12              // Color of HeartBeat when local queue is stalled [sf]

Var LatX          : Byte = 12
Var LatY          : Byte = 23
Var LatCol        : Byte = 7

Var UsrX          : Byte = 29
Var UsrY          : Byte = 23
Var UsrCol        : Byte = 7

Var CounterX1     : Byte = 60              // X position of characters counter [sf]
Var CounterY1     : Byte = 23              // X position of characters counter [sf]

Var CounterX2     : Byte = 64              // X position of max characters count [sf]
Var CounterY2     : Byte = 23              // X position of max characters count [sf]

//Var InputBg       : String = Chr(250)      // Input background character [sf]
Var InputBg       : String = Chr(32)      // Input background character [sf]
Var InputClr      : String = '|16|17|07'   // Input field color [sf]
Var Cursor        : String = Chr(178)      // Virtual Cursor Character
Var CursorBg      : String = '|25'         // Cursor Background color

//Var CIdx,TIdx     : Byte = 7               // Chat text color index [sf]
Var CIdx,TIdx     : Byte = 10               // Chat text color index [sf] [ml]

Var MClr          : String = '|24|10'      // Mention indicator colors (background+foreground)
Var MChr          : String = Chr(175)      // Mention indicator character
Var TClr          : Byte = 8               // Timestamp color
Var BBg           : Byte = 16              // Scroller background (16-23) [sf]
Var BClr          : Byte = 11              // Scroller color [sf]
Var BFad1         : Byte = 3               // Scroller fader color 1 [sf]
Var BFad2         : Byte = 8               // Scroller fader color 2 [sf]
Var BannerX       : Byte = 43              // XPosition of banner [sf]
Var BannerY       : Byte = 2               // YPosition of banner [sf]
Var BannerLen     : Byte = 36              // Length of banner [sf]
Var ScrollDly     : Byte = 0               // Banner scrolling start delay
Var ScrollSpeed   : Byte = 15              // Scroll speed factor (Lower = Faster)

// Define banner to scroll, loaded at each banner change (for dynamic content for example)
Procedure LoadBanners
Begin
    BannerList[1] := MRCVersion + MRCStats
    BannerList[2] := 'Find more about the connected BBSes using the /INFO command'
    BannerList[3] := 'Give a try to the new nick auto-completion feature using the TAB key'
    BannerList[4] := 'Reply to your last received private message using the /R shortcut'
    BannerList[5] := 'Wanna have a go at tqwCTF? Ask MeaTLoTioN for more information'
    BannerList[6] := 'Thanks to all who join thE grAvY trAIn each Friday, 29 user record! (2022-04-08)'
    // SysOp can add their own banners
End

//
// End of customization variables block [CUST]
//

Function ReadPlyr(I:Integer):Boolean
Var Ret  : Boolean = False
Var Fptr : File
Begin
    fAssign(Fptr,UserFile,66)
    fReset(Fptr)
    If IoResult = 0 Then Begin
        fSeek(Fptr,(I-1)*SizeOf(Plyr))
        If Not fEof(fptr) Then Begin
            fReadRec(Fptr,Plyr)
            Ret:=True
        End
        fClose(Fptr)
    End
    ReadPlyr:=Ret
End

Procedure SavePlyr(I:Integer)
Var Fptr : File
Begin
    fAssign(Fptr,Userfile,66)
    fReset(Fptr)
    If IoResult = 0 Then
        fSeek(Fptr,(I-1)*SizeOf(Plyr))
    Else Begin
        Plyr.RecIdx:=1
        fReWrite(Fptr)
    End
    fWriteRec(Fptr,Plyr)
    fClose(Fptr)
End

Function FindPlyr:Integer
Var X,Ret : Integer = 0
Var Done  : Boolean = False
Var UN    : String  = ''
Begin
    X:=1
    UN:=Upper(StripMCI(Replace(UserAlias,' ','_')))
    While ReadPlyr(X) And Not Done Do Begin
        If StripMCI(Upper(Plyr.Name)) = UN Then Begin
            Done:=True
            Ret:=X
        End
        X:=X+1
    End
    FindPlyr:=Ret
End

Procedure NewPlyr
Var I : Integer = 0
Begin
    I:=0
    While ReadPlyr(I+1) Do I:=I+1

    Plyr.RecIdx        :=I+1
    Plyr.PermIdx       :=UserIndex
    Plyr.EnterChatMe   :='|07- |15You have entered chat'
    Plyr.EnterChatRoom :='|07- |11%1 |03has arrived!'
    Plyr.LeaveChatMe   :='|07- |12You have left chat.'
    Plyr.LeaveChatRoom :='|07- |12%1 |04has left chat.'
    Plyr.EnterRoomMe   :='|07- |11You are now in |02%3'
    Plyr.LeaveRoomRoom :='|07- |02%1 |10has left the room.'
    Plyr.LeaveRoomMe   :='|07- |10You have left room |02%4'
    Plyr.EnterRoomRoom :='|07- |11%1 |03has entered the room.'
    Plyr.Defaultroom   :='lobby'
    Plyr.NameColor     :='|11'
    Plyr.LtBracket     :='|03<'
    Plyr.RtBracket     :='|03>'
    Plyr.UseClock      :=True
    Plyr.ClockFormat   :=False
    Plyr.ShowSmilies   :=False

    Plyr.Name:=StripMCI(Replace(UserAlias,' ','_'))

    SavePlyr(Plyr.RecIdx)
End

Procedure CleanOut
Var X : Byte = 0
Begin
    For X:=1 To 20       Do BannerList[X] := ''
    For X:=1 To 10       Do BufferHist[X] := ''
    For X:=1 To CLBuffer Do ChatLines[X]  := ''

    FindFirst(CfgTempPath + '*.mrc',66)
    While DosError = 0 Do Begin
        If FileExist(CfgTempPath+DirName) Then
            FileErase(CfgTempPath+DirName)
        FindNext
    End
    FindClose
    If FileExist(PInUse) Then
        fileErase(PInUse)
    If FileExist(ChatLog) Then
        fileErase(ChatLog)
End

// Add Banners from Server [sf]
Procedure AddBanner(Text:String)
Var BanExist : Boolean = False
Begin
    BanIdx := 1
    Repeat
        If BannerList[BanIdx] = Text Then
           BanExist := True
        BanIdx := BanIdx + 1
    Until Length(BannerList[BanIdx]) = 0 or BanIdx > 20
    If BanExist = False Then
    Begin
        If BanIdx < 21 Then
            BannerList[BanIdx] := Text
        BanIdx := 1
    End
End

Procedure UpdateScreen
Begin
    WriteXY(RoomX,RoomY,RoomAttr,PadRt('#'+MyRoom,30,' '))
    WriteXY(TopicX,TopicY,TopicAttr,PadRt(MyTopic,55,' '))
    WriteXY(LatX, LatY, LatCol, LatencyColor + PadLt(Int2Str(Latency), 3, ' ')) // [ml]
    WriteXY(UsrX, UsrY, UsrCol, RoomUsersColor + PadLt(Int2Str(WordCount(RoomUsers,',')), 2, ' ')) // [ml]
End

Procedure ShowChat(Top:Integer)
Var C,T,L,Y,X : Integer = 0
Var G,V,W     : String  = ''
Var N2D       : Boolean = True
Begin
    If RefreshChat Then
    Begin
        Y:=CLBuffer-WinSize-Top
      Write('|08')
        For X:=1 To WinSize+1 Do Begin
            GoToXy(1,WinTT+X-1)
            Write(ChatLines[Y]+'|16|$X80 ')
            Y:=Y+1
        End
        RefreshChat := False
    End
End

// Return PIPE code based on byte
Function GetPipe(C:Byte) : String
Begin
    If C < 32 Then
        GetPipe := '|' + PadLT(Int2Str(C), 2, '0')
End

// Parse chat into a message record
Function ParseChat(S:String) : MrcREc
Var MR    : MrcRec
Begin
    MR.FromUser := WordGet(1,S,'~')
    MR.FromSite := WordGet(2,S,'~')
    MR.FromRoom := WordGet(3,S,'~')
    MR.ToUser   := WordGet(4,S,'~')
    MR.ToSite   := WordGet(5,S,'~')
    MR.ToRoom   := WordGet(6,S,'~')
    MR.Message  := WordGet(7,S,'~')
    ParseChat   := MR
End

Procedure CheckUserlist(U:String)
Var X : Integer = 0
Var A : Boolean = True
Begin
    For X := 1 to WordCount(RoomUsers, ',') Do
        If Upper(U) = Upper(WordGet(X, RoomUsers, ',')) Then
            A := False

    If U = 'SERVER' or U = 'CLIENT' Then
        A := False

    If A = True Then
    Begin
        If Length(RoomUsers) > 0 Then
            RoomUsers := RoomUsers + ',' + U
        Else
            RoomUsers := U
    End
End

Procedure RedrawScreen
Begin
    DispFile('mrcmain')
    UpdateScreen
    RefreshChat:=True
    ShowChat(0)
End

// Cut string based on available space
// Word-wrap or string-cut based on the best option
Function StringCutter(S:String;L:Byte):Byte
Var P,W,O : Byte   = 0
Var S1,S2 : String = ''
Var Done  : Boolean = False
Begin
    P := Length(S)
    Repeat
        S1 := Copy(S,1,P)
        If Length(StripMCI(S1)) < L Then
        Begin
            O := WordCount(S1, ' ')
            W := WordPos(O, S1, ' ')

            If Length(StripMCI(S)) < L Or W < P - 10 Then
                W := 0

            If W > 0 Then
            Begin
                StringCutter := W - 1
                Done := True
            End
            Else
            Begin
                StringCutter := P
                Done := True
            End
        End
        P := P-1
    Until Done = True
End

Procedure Add2Chat(S:String)
Var E,W,L,B,A,X    : Integer = 0
Var DS,S1,S2,S3,S4 : String = ''
Var HL             : String = ''
Var ALL            : String = '@ROOM'
Var SM1,SM2,SM3    : Integer
Begin
    // Try and replace a :) or :D with a  or 
    If Plyr.ShowSmilies Then
    Begin
        While Pos(':)', S) > 0 Do
        Begin
            SM1:=Pos(':)', S)
            SM2:=SM1+1
            Delete(S,SM2,1)
            S[SM1]:=Chr(1)
        End
        While Pos(':D', S) > 0 Do
        Begin
            SM1:=Pos(':D', S)
            SM2:=SM1+1
            Delete(S,SM2,1)
            S[SM1]:=Chr(2)
        End
        While Pos('=)', S) > 0 Do
        Begin
            SM1:=Pos('=)', S)
            SM2:=SM1+1
            Delete(S,SM2,1)
            S[SM1]:=Chr(2)
        End
    End

    // Highlight on nick mention [sf]
    HL := '|16|00.'
    If Pos(Upper(UserTag), Upper(StripMCI(Copy(S, Length(WordGet(1,S,' ')), Length(S))))) > 0 Then
    Begin
        Write('|[X02|[Y02|16|00|BE|07')
        HL := MClr + MChr + '|16|07'
    End

    If Pos(Upper(ALL), Upper(StripMCI(Copy(S, Length(WordGet(1,S,' ')), Length(S))))) > 0 Then
    Begin
        Write('|[X02|[Y02|16|00|BE|07')
        HL := MClr + MChr + '|16|07'
    End

    S3:=' ' + Chr(28) + ' '
    If Plyr.UseClock Then Begin
    Begin
        DS:=TimeStr(DateTime,Plyr.ClockFormat)
        If Not Plyr.ClockFormat Then
            Delete(DS,6,3)
        S:=GetPipe(TClr)+DS+HL+'|16|07'+S+'|16'
        S3:=StrRep(' ', Length(DS)) + S3
    End
    Else
        S:=HL+'|16|07'+S

    S1:=S
    Repeat
        Delay(5)

        W := StringCutter(S1,79)

        If Length(S1) > W Then
        Begin
            S2 := Copy(S1, W+1, Length(S1))
            S4 := Copy(S1, 1, W)
            S1 := S4
        End
        Else
            S2 := ''

        If (S1 <> '')  Then
        Begin
            For X:=2 To CLBuffer Do
                ChatLines[X-1]:=ChatLines[X]
            ChatLines[CLBuffer]:='|16'+S1
            AppendText(ChatLog,ChatLines[CLBuffer])
            RefreshChat := True
            S1:=S3+S2
        End

    Until S2=''
End

// Check if stale outbound messages are stuck in queue
Procedure CheckStale
Begin
    HBClr := HeartbeatGood
    FindFirst(SvrQueuePath + PathChar + '*.mrc', 63)
    While DOSError = 0 Do
    Begin
        If DateTime > DirTime Then
            HBClr := HeartbeatBad
        FindNext
    End
    FindClose
End

Procedure MakeChatEntry(S:String)
Var Fil : String = SvrQueuePath + PathChar +
    Int2Str(NodeNum) + Int2Str(ChatSeed) +
    Int2Str(Random(9))+Int2Str(Random(9)) + '.mrc'
Begin
    AppendText(Fil,S)
    ChatSeed:=ChatSeed+1
End

Procedure SendOut(FU,FS,FR,TU,TS,TR,S:String)
Var TX : String = ''
Begin
    TX:=FU+'~'+FS+'~'+FR+'~'+TU+'~'+TS+'~'+TR+'~'+S+'~'
    MakeChatEntry(TX)
End

Procedure SendToMe(S:String)
Begin
    Add2Chat(S)
    ShowChat(0)
End

Procedure SendToAllNotMe(S:String)
Begin
    SendOut(UserTag,SiteTag,MyRoom,'NOTME','','',S)
End

Procedure SendToRoomNotMe(S:String)
Begin
    SendOut(UserTag,SiteTag,MyRoom,'NOTME','',MyRoom,S)
End

Procedure SendToAll(S:String)
Begin
    SendOut(UserTag,SiteTag,MyRoom,'','','',S)
End

Procedure SendToRoom(S:String)
Begin
    If Pos('@ROOM',Upper(S)) > 0 Then
      SendOut(UserTag,SiteTag,MyRoom,'','',MyRoom,'|21|15'+S)
    Else
      SendOut(UserTag,SiteTag,MyRoom,'','',MyRoom,S)
End

Procedure SendToUser(U,S:String)
Begin
    SendOut(UserTag,SiteTag,MyRoom,U,'','',S)
End

Procedure SendToClient(S:String)
Begin
    SendOut(UserTag,SiteTag,MyRoom,'CLIENT',SiteTag,MyRoom,S)
End

Procedure SendToServer(S:String)
Var SS : String
Begin
    SendOut(UserTag,SiteTag,MyRoom,'SERVER',SiteTag,MyRoom,S)
End

Procedure ProcessChat(MR:MRCRec)
Var Ok2Send                 : Boolean = True
Var Command,Opt1,Opt2,Stats : String  = ''
Begin

    // Handle topic set from server
    If Mr.FromUser = 'SERVER' and
        Pos('ROOMTOPIC',Mr.Message) > 0 Then
    Begin
        Ok2Send := False
        Command:=WordGet(1,Mr.Message,':')
        opt1:=WordGet(2,Mr.Message,':')
        opt2:=Copy(Mr.Message,
             WordPos(3,Mr.Message,':'),
             Length(Mr.Message)-WordPos(3,Mr.Message,':')+1)
        If Opt1 = MyRoom Then Begin
            MyTopic:=Opt2
            UpdateScreen
        End
    End

    // Handle userlist from server
    If Mr.FromUser = 'SERVER' and
        Pos('USERLIST',Mr.Message) > 0 Then
    Begin
        Ok2Send   := False
        Command   := WordGet(1,Mr.Message,':')
        opt1      := WordGet(2,Mr.Message,':')
        RoomUsers := opt1
        WriteXY(UsrX, UsrY, UsrCol, RoomUsersColor + PadLt(Int2Str(WordCount(RoomUsers,',')), 2, ' ')) // [ml]
    End

    // Handle client hello request
    If Mr.FromUser = 'SERVER' and
        Mr.Message = 'HELLO' Then
    Begin
        Ok2Send := False
        SendToServer('IAMHERE')
    End

    // Handle Latency from client
    If Mr.FromUser = 'SERVER' and
        Pos('LATENCY',Mr.Message) > 0 Then
    Begin
        Ok2Send := False
        Latency := Str2Int(WordGet(2,Mr.Message,':'))
        If Latency > 999 Then
            Latency := 999
        If Latency > 250 Then               // [ml]
            LatencyColor := '[1;31m'      // [ml]
        Else                                // [ml]
            LatencyColor := '[1;32m'      // [ml]
        WriteXY(LatX, LatY, LatCol, LatencyColor + PadLt(Int2Str(Latency), 3, ' ')) // [ml]
    End

    // Handle stats from client
    If Mr.FromUser = 'SERVER' and
        Pos('STATS',Mr.Message) > 0 Then
    Begin
        Ok2Send := False
        Stats := WordGet(2,Mr.Message,':')
        If Length(Stats) > 0 Then
        Begin
            MRCStats := ' :: Server Stats >> BBSes:' + WordGet(1, Stats, ' ') +
                ' Rooms:' + WordGet(2, Stats, ' ') +
                ' Users:' + WordGet(3, Stats, ' ')
            LoadBanners
        End
    End

    // Handle Banners from server
    If Mr.FromUser = 'SERVER' and
        Pos('BANNER',Mr.Message) > 0 Then
    Begin
        Ok2Send := False
        AddBanner(WordGet(2,Mr.Message,':'))
    End

    // Message for another room
    If MR.ToRoom <> '' Then
        if Upper(MR.ToRoom) <> Upper(MyRoom) Then
            Ok2Send:=False

    // Message not empty and not for me
    If MR.ToUser <> '' Then
        If Mr.ToUser <> 'NOTME' Then
            If Pos(Upper(MR.ToUser),Upper(UserTag))=0
                 Then Ok2Send:=False
    Else
        If Mr.ToUser <> 'NOTME' Then
            If Upper(Mr.FromUser) = Upper(UserTag) Then
                Ok2Send:=False

    If Upper(Mr.FromUser) = Upper(UserTag) and
        Mr.ToUser = 'NOTME' Then
            Ok2Send:=False

    If Mr.FromUser <> 'SERVER' and Mr.FromUser <> 'CLIENT' Then
        If Upper(Mr.ToUser) = Upper(UserTag) Then
            LastPrivMsg := Mr.FromUser

    If Ok2Send Then
    Begin
        Add2Chat(MR.Message)
        CheckUserlist(MR.FromUser)
    End
End

Procedure ReadChatFiles
Var F1      : File
Var S       : String  = ''
Var Ret     : Boolean = False
Var TLines  : Array [1..100] of String [255]
Var TSorted : Array [1..100] of String [255]
Var TStamp  : LongInt = 0
Var LCount  : Byte = 0
Var Largest : LongInt = 0
Var LIndex  : Byte = 0
Var A,B,F,L : Byte = 0
Begin
    FindFirst(CfgTempPath+'*.mrc',66)
    While DOSError = 0 Do Begin
        Ret:=True
        fAssign(F1,CfgTempPath+DirName,66)
        fReset(F1)
        L:=0
        While Not fEof(F1) Do Begin
            fReadLn(F1,S)
            LCount:=LCount+1
            TStamp := Str2Int(Copy(DirName, 1, 8)) + L
            TLines[LCount] :=  Int2Str(TStamp) + ' ' + S
            L:=L+1
        End
        fClose(F1)
        fileErase(CfgTempPath+DirName)
        FindNext
    End
    FindClose

    // Little home-made sorting routine
    // Sort loop 1 - Populate array from largest to lowest
    For A:=LCount DownTo 1 Do
    Begin
        // Sort loop 2 - Read original array from
        Largest := 0

        For B:=1 to LCount Do
        Begin
            If Str2Int(WordGet(1, TLines[B], ' ')) > Largest Then
            Begin
                Largest := Str2Int(WordGet(1, TLines[B], ' '))
                LIndex  := B
            End
        End
        TSorted[A] := Copy(TLines[LIndex],
                      WordPos(2, TLines[LIndex], ' '),
                      Length(TLines[LIndex]) - WordPos(2, TLines[LIndex], ' ') + 1)
        TLines[LIndex] := '0'
    End

    // Process messages from the sorted array
    For F:=1 to LCount Do
    Begin
        If WordCount(TSorted[F], '~') > 6 Then
        Begin
            ServFile:=ParseChat(TSorted[F])
            ProcessChat(ServFile)
        End
    End

    If Ret Then ShowChat(0)
End

Function UpdateStrings(S,M,U,NR,OR:String):String
Begin
    S:=Replace(S,'%1',M)
    S:=Replace(S,'%2',U)
    S:=Replace(S,'%3','#'+NR)
    S:=Replace(S,'%4','#'+OR)
    UpdateStrings:=S
End

// Display error message to chat window [sf]
Procedure ShowError(S:String)
Begin
    Add2Chat('|15!|12 ' + S)
    ShowChat(0)
End

Procedure JoinRoom(S:String;B:Boolean)
Var NewRoom,OldRoom : String = ''
Begin
    If Length(S) > 30 Then
        ShowError('Room name is limited to 30 chars max')
    Else Begin
        If Length(S) > 0 Then Begin
            OldRoom:=MyRoom
            NewRoom:=lower(S)
            StripB(S,'#')
            SendToServer('NEWROOM:'+MyRoom+':'+S)
            If B Then Begin
                SendToMe(UpdateStrings(Plyr.LeaveRoomMe,Plyr.Name,'',NewRoom,OldRoom))
                SendToRoomNotMe(UpdateStrings(Plyr.LeaveRoomRoom,Plyr.Name,'',NewRoom,OldRoom))
                MyRoom:=NewRoom
                SendToMe(UpdateStrings(Plyr.EnterRoomMe,Plyr.Name,'',NewRoom,OldRoom))
                SendToRoomNotMe(UpdateStrings(Plyr.EnterRoomRoom,Plyr.Name,'',NewRoom,OldRoom))
            End
            MyRoom:=S
            SetPromptInfo(4,'#'+S)
            UpdateScreen
            SendToServer('USERLIST')
        End
    End
End

Procedure ChangeNick(LRNC,N:String;Announce:Boolean)
Var ON : String = ''
Begin

    Case LRNC Of
//        'N':    Plyr.Name:=StripMCI(N)

        // Limit left bracket to 1 visible character [sf]
        'L':    Begin
            If Length(StripMCI(N)) > 1 Then
                ShowError('Left bracket max length is 1 char')
            Else
                Plyr.LtBracket:=N
            End

        // Limit right bracket to 8 visible character [sf]
        // Record length stays at 16 for compatibility
        'R':    Begin
            If Length(StripMCI(N)) > 8 or Length(N) > 16 Then
                ShowError('Right brackets max length is 8 chars (16 including Pipe codes)')
            Else
                Plyr.RtBracket:=N
            End

        // Make sure Nick color is a color PIPE code [sf]
        'C':    Begin
            If Length(StripMCI(N)) > 0 or Length(N) <> 3 Then
                ShowError('Only color pipe codes allowed for nick color')
            Else
                Plyr.NameColor:=N
            End
    End

    SavePlyr(Plyr.RecIdx)
    MyNamePrompt:=Plyr.LtBracket+Plyr.NameColor+StripMCI(Plyr.Name)+Plyr.RtBracket+'|16|07 '
End

Procedure Init
Var X,Y : Integer = 0
Var K,S : String = ''
Begin
    S:=Int2Str(NodeNum)
    For X:=1 To 3 Do
        S:=S+Int2Str(Random(9))
    ChatSeed:=Str2Int(S)
    ChatLog:=CfgTempPath+'mrcchat.log'
    PInUse:=CfgTempPath+'tchat.inuse'

    If Upper(UserAlias) = 'SERVER' or
        Upper(UserAlias) = 'CLIENT' or
        Upper(UserAlias) = 'NOTME' Then
    Begin
        WriteLn('|16|12|CL|CRUnfortunately, your User Alias is a reserved word and therefore cannot be used.')
        WriteLn('|12Please ask your SysOp to change your User Alias to use MRC.')
        WriteLn('|CR|PA|07|CL')
        Halt
    End

    BBSTempStub:=CfgTempPath
    Y:=Pos(Int2Str(NodeNum),BBSTempStub)
    If Y > 0 Then
        Delete(BBSTempStub,Y,Length(Int2Str(NodeNum))+1)

    Y:=FindPlyr
    If Y = 0 Then NewPlyr
    Else ReadPlyr(Y)

    SiteTag:=StripMCI(Replace(MCI2Str('BN'),' ','_'))
    UserTag:=StripMCI(Replace(UserAlias,' ','_'))
    ChangeNick('N',UserTag,False)
    DispFile('mrcmain')
    GetScreenInfo(1,WinTL,WinTT,WinAttr)
    GetScreenInfo(2,WinBL,WinBB,WinAttr)
    GetScreenInfo(3,PromptX,PromptY,PromptAttr)
    GetScreenInfo(4,RoomX,RoomY,RoomAttr)
    GetScreenInfo(5,TopicX,TopicY,TopicAttr)
    WinSize:=WinBB-WinTT

    AppendText(PInUse,'0')
    MenuCmd('NA','mUltI rElAY chAttIng')
End

Procedure DoHelp
Begin
    Write('|16|11')
    DispFile('mrchelp')
    RedrawScreen
End

Procedure DoWho
Begin
    Write('|16|11')
    MenuCmd('NW','')
    RedrawScreen
End

Procedure ChangeTopic(S:String)
Var R : String = ''
Begin
    if Length(S) > 55 Then
        ShowError('Topic is limited to 55 chars max')
    Else Begin
        SendToServer('NEWTOPIC:'+MyRoom+':'+S)
        UpdateScreen
    End
End

Procedure DoPrivateMsg(S:String)
Var M,U : String = ''
Var L   : Integer = 0
Begin
    Var WC  : Byte  = WordCount(S, ' ')
    if WC > 2 Then
    Begin
      U:=Upper(WordGet(2,S,' '))
      L:=Pos(U,Upper(S))
      L:=L+Length(U)+1
      M:='|15* |08(|15'+Plyr.Name+'|08/|14PrivMsg|08) |07'+Copy(S,L,Length(S)-L+1)
      SendToUser(U,M)
      Add2Chat('|15* |08(|14PrivMsg|08->|15' + U + '|08) '+ GetPipe(CIdx) + Copy(S,L,Length(S)-L+1))
      ShowChat(0)
    End
End

Procedure DoBroadcast(S:String)
Var M : String = ''
Begin
    M:='|15* |08(|15'+Plyr.Name+'|08/|14Broadcast|08) |07'+Copy(S,4,Length(S)-3)
    SendToAll(M)
End

Procedure DoMeAction(S:String)
Var R : String = ''
Begin
    R:=Copy(S,5,Length(S)-4)
    SendToRoom('|15* |13'+Plyr.Name+' ' + R)
End

Procedure DoTroutAction(S:String)
Var R : String = ''
Var Trout : String = ''
Var Tweet : String = ''
Begin
    Trout:='|12<''),))><  |15whaaaPish|07'
    R:=Copy(S,8,Length(S)-4)
    SendToRoom('|15* |13'+Plyr.Name+' |14troutslaps |13'+R+': '+Trout)
    Tweet:='/mystic/scripts/tweetme/twitter.py "'+Plyr.Name+' troutslaps '+R+': <''),))><  whaaaPish #retrocomputing #bbs #mrc #troutslap #sysop #mysticbbs #tqwNet"'
    MenuCmd('DD', Tweet);
End


// Buffer history handling [sf]
Procedure AddToBufferHistory(B:String)
Var I : Byte = 0
Begin
    For I := 10 DownTo 2 Do
    Begin
        If Length(BufferHist[I-1]) > 0 Then
            BufferHist[I] := BufferHist[I-1]
    End
    BufferHist[2] := B
End

// Select next banner from the defined list [sf]
Procedure NextBanner
Begin
    Repeat
        BanIdx := BanIdx + 1
        If BanIdx > 20 Then BanIdx := 1
    Until Length(BannerList[BanIdx]) > 0
    ScrollWait := 0
    BannerOff := 0
End

// Display and scroll banners [sf]
Function ScrollBanner
Var BS: String = StripMCI(BannerList[BanIdx])
Begin
    // This is a scrolling banner

    // Add white padding for nice scroll entry/exit
    BS:=StrRep(' ', BannerLen) + BS + StrRep(' ', BannerLen)

    // Initial display before we start scrolling
    If ScrollWait = 0 Then
    Begin
        BS:=GetPipe(BBg)+GetPipe(BClr) + Copy(BS, 1, BannerLen-2) +
            GetPipe(BFad1) + Copy(BS, BannerLen-1, 1) +
            GetPipe(BFad2) + Copy(BS, BannerLen, 1) + '|16'
        BannerOff := BannerOff + 1
        GoToXy(BannerX, BannerY)
        Write(BS)
        GoToXy(HeartBeatX, HeartBeatY)
    End

    // We have made it to the end
    If BannerOff > Length(BS) - BannerLen Then
    Begin
        BS:=GetPipe(BBg)+GetPipe(BFad2) + Copy(BS, BannerOff, 1) +
            GetPipe(BFad1) + Copy(BS, BannerOff+1, 1) +
            GetPipe(BClr) + Copy(BS, BannerOff+2, BannerLen-2) + '|16'
        GoToXy(BannerX, BannerY)
        Write(BS)
        GoToXy(HeartBeatX, HeartBeatY)
        ScrollWait := 0
        NextBanner
    End

    // Let's start the scrolling shall we
    If ScrollWait > ScrollDly Then
    Begin
        BS:=GetPipe(BBg)+GetPipe(BFad2) + Copy(BS, BannerOff, 1) +
            GetPipe(BFad1) + Copy(BS, BannerOff+1, 1) +
            GetPipe(BClr) + Copy(BS, BannerOff+2, BannerLen-4) +
            GetPipe(BFad1) + Copy(BS, BannerOff+BannerLen-2, 1) +
            GetPipe(BFad2) + Copy(BS, BannerOff+BannerLen-1, 1) + '|16'
        BannerOff := BannerOff + 1
        GoToXy(BannerX, BannerY)
        Write(BS)
        GoToXy(HeartBeatX, HeartBeatY)
    End

    // Not yet
    Else
    Begin
        ScrollWait := ScrollWait + 1
        GoToXy(HeartBeatX, HeartBeatY)
    End
End

// Buffer history seeker [sf]
Function GetBufferIndex(Idx:Byte;Dir:Integer) : Byte
Var NIdx: Byte = 0
Begin
    NIdx := Idx + Dir
    GetBufferIndex := Idx

    If NIdx > 1 and NIdx < 10 and Length(BufferHist[NIdx]) > 0 Then
        GetBufferIndex := NIdx

    If NIdx = 1 Then
        GetBufferIndex := NIdx
End

// Color Index seeker [sf]
Function GetColorIndex(Idx:Byte;Dir:Integer) : Byte
Var MIdx: Byte = 0
Begin
    MIdx := Idx + Dir

    // Span from Blue...
    If MIdx < 1 Then
        MIdx := 1

    // ... to Bright White
    If MIdx > 15 Then
        MIdx := 15

    GetColorIndex := MIdx
End

Function RainbowString(InString:String) : String
Var PlString : String = ''
Var RbString : String = ''
Var PlStrPos : Byte   = 0
Var PlStrLen : Byte   = 0
Var X        : Byte   = 0
Begin
    PlStrPos := WordPos(2, InString, ' ')
    PlStrLen := Length(InString) - (PlStrPos-1)
    PlString := Copy(InString, PlStrPos, PlStrLen)
    For X:=1 To PlStrLen Do
        RbString := RbString + GetPipe(Random(14)+1) + Copy(PlString, X, 1)

    RainbowString := RbString
End

//Kewl Speak by [mL]
Function KewlString(InString:String): String
Var PlString : String = ''
Var KlString : String = ''
Var PlStrPos : Byte   = 0
Var PlStrLen : Byte   = 0
Var X        : Byte   = 0
Begin
    PlStrPos := WordPos(2, InString, ' ')
    PlStrLen := Length(InString) - (PlStrPos-1)
    PlString := Copy(InString, PlStrPos, PlStrLen)
    For X:=1 to PlStrLen Do
    Begin
        Case Upper(PlString[X]) Of
          'A','E','I','O','U': PlString[X] := Lower(PlString[X])
        Else
          PlString[X] := Upper(PlString[X])
        End
        KlString := KlString + Copy(PlString, X, 1)
    End

    KewlString := KlString
End

// Leet Speak by [mL]
Function LeetString(InString:String): String
Var PlString : String = ''
Var LtString : String = ''
Var PlStrPos : Byte   = 0
Var PlStrLen : Byte   = 0
Var X        : Byte   = 0
Begin
    PlStrPos := WordPos(2, InString, ' ')
    PlStrLen := Length(InString) - (PlStrPos-1)
    PlString := Copy(InString, PlStrPos, PlStrLen)
    For X:=1 to PlStrLen Do
    Begin
        Case Upper(PlString[X]) Of
            'A': PlString[X] := '4'
            'E': PlString[X] := '3'
            'I': PlString[X] := '1'
            'L': PlString[X] := '1'
            'O': PlString[X] := '0'
            'S': PlString[X] := '5'
            'T': PlString[X] := '7'
        Else
            PlString[X] := Upper(PlString[X])
        End
        LtString := LtString + Copy(PlString, X, 1)
    End

    LeetString := LtString
End

//Jumble Speak by [mL]
Function JumbleString(InString:String): String
Var PlString : String = ''
Var JlString : String = ''
Var Tweet    : String = ''
Var PlStrPos : Byte   = 0
Var PlStrLen : Byte   = 0
Var X        : Byte   = 0
Var Y        : Byte   = 0
Begin
    Var WC : Byte   = WordCount(InString, ' ')
    For X:=2 to WC Do
    Begin
        Var WG : String = WordGet(X, InString, ' ')
        Var WL : Byte   = Length(WG)
        Var TmpString : String = ''
        If WL > 3 Then
        Begin
            TmpString:=WG[1]
            For Y:= WL-1 downto 2 Do
            Begin
                TmpString:=TmpString+WG[Y]
            End
            TmpString:=TmpString+WG[WL]
        End
        Else
        Begin
            TmpString:=WG
        End
        JlString:=JlString+TmpString
        Var JC : Byte = WordCount(JlString, ' ')
        If WC-1 > JC Then
            JlString:=JlString+' '
    End

    JumbleString := JlString
    Tweet := '/mystic/scripts/tweetme/twitter.py "'+Plyr.Name+' just jumbled their words in MRC: '+JlString+' #bbs #mrc #jumble #mysticbbs #tqwNet"'
    //MenuCmd('DD', Tweet);

End

// Rot13 String by [mL]
Function Rot13String(InString:String): String
Var X : Byte = 0;
Var Y : Byte = 0;
Var NormL : String = 'abcdefghijklmnopqrstuvwxyz';
Var RotL  : String = 'nopqrstuvwxyzabcdefghijklm';

Begin
    Var WC : Byte  = WordCount(InString, ' ')
    Var TmpString : String = ''
    For X := 2 to WC Do
    Begin
        Var WG : String = WordGet(X, InString, ' ')
        Var WL : Byte   = Length(WG)
        Var TmpChr    : String
        Var TmpPos    : Byte = 0;
        For Y := 1 to WL Do
        Begin
            TmpChr := Lower(WG[Y])
            TmpPos := Pos(TmpChr, NormL)
            If TmpPos > 0 Then
                TmpString := TmpString+RotL[TmpPos]
            Else
                TmpString := TmpString+WG[Y]
        End
        If X < WC Then
            TmpString := TmpString+' '
    End
    Rot13String := TmpString
End

Function InputLine:String
Var IX,UL : Integer = 0
Var Ch    : Char    = #13
Var IBuf  : String  = ''    // Input buffer [sf]
Var DBuf  : String  = ''    // Displayed buffer [sf]
Var RBuf  : Boolean = False // Refresh buffer flag [sf]
Var Done  : Boolean = False // Done getting input (Enter) [sf]
Var Anim  : Byte    = 1     // Animation step [sf]
Var BIdx  : Byte    = 1     // Buffer Current Idx [sf]
Var NIdx  : Byte    = 1     // Buffer Target Idx [sf]
Var CClr  : Byte    = 7     // Char counter color [sf]
Var Words : String  = ''
Var LastW : String  = ''
Var PrefixLen : Byte = 0
Var SM1,SM2,SM3 : Byte
Begin
    UL:=Length(StripMCI(MyNamePrompt))
    IX:=PromptX+Length(StripMCI(MyNamePrompt))

    // Derive the maximum allowed buffer bnased on packet fields
    PrefixLen := Length(UserTag) + Length(SiteTag) + Length(MyRoom)*2 + Length(MyNamePrompt) + 20

    // Init the characters counter [sf]
    WriteXY(CounterX1, CounterY1, 7, PadLt(Int2Str(Length(IBuf)), 3, '0'))
    WriteXY(CounterX2, CounterY2, 7, PadLt(Int2Str(IMaxBuffer), 3, '0'))

    // Init the buffer input bar [sf]
    GoToXy(PromptX,PromptY)
    Write('|16' + MyNamePrompt + InputClr + GetPipe(CIdx) + DBuf +
         CursorBg + Cursor + InputClr + '|$X78' + InputBg)

    Repeat
        While Not Keypressed Do
        Begin
            // Improved polling time to keyboard [sf]
            Delay(10)

            // Read chat files every 7 cycles [sf]
            // Slightly improve file access rate
            If Loop % 7 = 0 Then
                ReadChatFiles

            // Read chatroom userlist [sf]
            If Loop % 1999 = 0 Then
                SendToServer('USERLIST')

            // Heartbeat to server every 12000 cycles
            // Maintain server heartbeat rate
            If Loop % 11987 = 0 Then Begin
                SendToServer('IAMHERE')
            End

            // Also re-read banners from server and add new ones
            If Loop > 47948 Then Begin
                SendToServer('BANNERS')
                Loop:=1
            End

            If Loop % ScrollSpeed = 0 Then
                ScrollBanner

            If Loop % 499 = 0 Then
                CheckStale

            If Loop % 997 = 0 Then
            Begin
                If HBClr = HeartbeatGood Then
                    SendToClient('LATENCY')
            End

            // Animate the heartbeat animation every 53 cycles [sf]
            If Loop % 53 = 0 Then
            Begin
                Anim := Anim + 1
                If Anim > Length(HeartBeat) Then
                    Anim := 1
                WriteXY(HeartBeatX, HeartBeatY, HBClr, Copy(HeartBeat, Anim, 1))
                GoToXy(HeartBeatX, HeartBeatY)
            End

            Loop:=Loop+1
        End

        // Handle arrow keys [sf]
        AllowArrow := True
        Ch := ReadKey

        // Buffer history handling [sf]
        If IsArrow Then
        Begin
            Case Ch Of
                Chr(72) : NIdx := GetBufferIndex(BIdx, 1)   // Scroll back input (Up)
                Chr(80) : NIdx := GetBufferIndex(BIdx, -1)  // Scroll forward input (Dn)
                Chr(81) : TIdx := GetColorIndex(CIdx, -1)   // Decrease color index (PgDn)
                Chr(73) : TIdx := GetColorIndex(CIdx, 1)    // Increase color index (PnUp)
            Else
                NIdx := BIdx
                TIdx := CIdx
            End

            Ch := Chr(0)

            If BIdx <> NIdx Then
            Begin
                IBuf := BufferHist[NIdx]
                BIdx := NIdx
                RBuf := True
            End
            Else
            If CIdx <> TIdx Then
            Begin
                CIdx := TIdx
                RBuf := True
            End
        End

        // PIPE codes whitelist [sf]
        If Copy(IBuf, Length(IBuf), 1) = '|' Then
        Begin
            Case Ch Of
                '0',
                '1',
                '2',
                '3',
                '|',
                Chr(32),
                Chr(8),
                Chr(27)    : Ch := Ch
            Else
                Ch := Chr(0)
            End
        End

        If Ch = Chr(32) and Length(IBuf) < 1 Then
            Ch := Chr(0)

        // Nick auto-completion [sf]
        If Ch = Chr(9) Then
        Begin
            Var WC : Byte   = WordCount(IBuf, ' ')    // Count of words in buffer
            Var LW : String = WordGet(WC, IBuf, ' ')  // Last word in buffer
            Var WL : Byte   = Length(LW)              // Length of the last word in buffer

            // Define display if at the beginning or mid-sentence
            Var Tail : String = ''
            If WC < 2 Then
                Tail := ': '
            Else
                Tail := ' '

            If LastUSearch = ''  Then
                LastUSearch := LW

            If WL > 0 and Length(RoomUsers) > 0 Then
            Begin
                Var PF :String = Copy(IBuf, 1, WordPos(WC, IBuf, ' ')-1)  // Buffer prefix
                Var UMatch : Boolean = False
                Var SLoop  : Byte = 0

                While Not UMatch Do
                Begin
                    If UserIdx > WordCount(RoomUsers, ',') Then UserIdx := 1
                    Var UHandle : String = WordGet(UserIdx, RoomUsers, ',')
                    If Length(UHandle) > 0 and
                         Upper(LastUSearch) = Upper(Copy(UHandle, 1, Length(LastUSearch))) Then
                    Begin
                        UMatch := True
                        IBuf := PF + UHandle + Tail
                    End
                    UserIdx:=UserIdx+1
                    SLoop:=SLoop+1
                    If SLoop > WordCount(RoomUsers, ',') Then UMatch := True
                End
            End
        End
        Else
        Begin
            LastUSearch := ''
            UserIdx     := 1
        End

        IMaxBuffer := 255 - PrefixLen
        If IMaxBuffer > MaxBuffer Then IMaxBuffer := MaxBuffer

        If Lower(WordGet(1, IBuf, ' ')) = '/rainbow' Then
            IMaxBuffer := Abs(IMaxBuffer/4) - 4

        If Lower(WordGet(1, IBuf, ' ')) = '/t' Then
        Begin
          CIdx := 15
          TIdx := 15
          CursorBg := '|28'
          InputClr := '|20|15|07'
        End
        Else If Lower(WordGet(1, IBuf, ' ')) = '/r' Then
        Begin
          CIdx := 15
          TIdx := 15
          CursorBg := '|28'
          InputClr := '|20|15|07'
        End
        Else If Lower(WordGet(1, IBuf, ' ')) = '/m' Then
        Begin
          CIdx := 15
          TIdx := 15
          CursorBg := '|28'
          InputClr := '|20|15|07'
        End
        Else If Lower(WordGet(1, IBuf, ' ')) = '/msg' Then
        Begin
          CIdx := 15
          TIdx := 15
          CursorBg := '|28'
          InputClr := '|20|15|07'
        End
        Else If Lower(WordGet(1, IBuf, ' ')) = '/b' Then
        Begin 
            CIdx := 15
            TIdx := 15
            CursorBg := '|26'
            InputClr := '|18|15|07'
        End
        Else
        Begin
          //CIdx := 10
          //TIdx := 10
          CursorBg := '|25'
          InputClr := '|16|17|07'
        End

        // Send to server and add to buffer history [sf]
        If Ch = Chr(13) Then
        Begin

            // Try and replace a :) or :D with a  or 
            If Plyr.ShowSmilies Then
            Begin
                While Pos(':)', IBuf) > 0 Do
                Begin
                    SM1:=Pos(':)', IBuf)
                    SM2:=SM1+1
                    Delete(IBuf,SM2,1)
                    IBuf[SM1]:=Chr(1)
                End
                While Pos(':D', IBuf) > 0 Do
                Begin
                    SM1:=Pos(':D', IBuf)
                    SM2:=SM1+1
                    Delete(IBuf,SM2,1)
                    IBuf[SM1]:=Chr(2)
                End
                While Pos('=)', IBuf) > 0 Do
                Begin
                    SM1:=Pos('=)', IBuf)
                    SM2:=SM1+1
                    Delete(IBuf,SM2,1)
                    IBuf[SM1]:=Chr(2)
                End
            End

            If Lower(WordGet(1, IBuf, ' ')) = '/rainbow' Then
                InputLine := RainbowString(IBuf)
            Else If Lower(WordGet(1, IBuf, ' ')) = '/kewl' Then
                InputLine := KewlString(IBuf)
            Else If Lower(WordGet(1, IBuf, ' ')) = '/leet' Then
                InputLine := LeetString(IBuf)
            Else If Lower(WordGet(1, IBuf, ' ')) = '/jumble' Then
                InputLine := JumbleString(IBuf)
            Else If Lower(WordGet(1, IBuf, ' ')) = '/rot13' Then
                InputLine := Rot13String(IBuf)
            Else
                InputLine := IBuf

            AddToBufferHistory(IBuf)
            IBuf := ''
            BIdx := 1
            IMaxBuffer := MaxBuffer
            WriteXY(CounterX1, CounterY1, 7, PadLt(Int2Str(Length(IBuf)), 3, '0'))
            WriteXY(CounterX2, CounterY2, 7, PadLt(Int2Str(IMaxBuffer), 3, '0'))
            Done := True

            //CIdx := 10
            //TIdx := 10
            CursorBg := '|25'
            InputClr := '|16|17|07'

        End
        Else

        // Clear input buffer with ESC [sf]
        If Ch = Chr(27) Then
        Begin
            IBuf := ''
            BIdx := 1
            RBuf := True
        End
        Else
        Begin
            // Handle backspace [sf]
            If Ch = Chr(8) Then
            Begin
                Delete (IBuf, Length(IBuf), 1)
                RBuf := True
            End
            Else

            // Allow characters between #32 and #126 only [sf]
            Begin
                If Ord(Ch) > 31 and Ord(Ch) < 127 Then
                Begin
                    // Limit input buffer length [sf]
                    If Length(IBuf) < IMaxBuffer Then
                    Begin
                        IBuf := IBuf + Ch
                        RBuf := True
                    End
                End

                // Ignore any other character [sf]
                Else
                    Ch := ''
            End
        End

        if Upper(Copy(IBuf,1,3)) = '/R ' and LastPrivMsg <> '' Then
            IBuf := '/t ' + LastPrivMsg + ' '

        // Refresh buffer only if changed [sf]
        If RBuf Then
        Begin
            // Scroll input buffer [sf]
            If Length(IBuf) > 78-PromptX-UL Then
                DBuf := Copy(IBuf, Length(IBuf) - (77-PromptX-UL), 78-PromptX-UL)
            Else
                DBuf := IBuf

            // Update input bar [sf]
            GoToXy(PromptX,PromptY)

            Write('|16' + MyNamePrompt + InputClr + GetPipe(CIdx) +
                DBuf + CursorBg + Cursor + InputClr + '|$X78' + InputBg + '|16')

            // Handle counter color coding [sf]
            CClr := 7
            If Length(IBuf) > IMaxBuffer -20 Then
                CClr := 14
            If Length(IBuf) > IMaxBuffer -10 Then
                CClr := 12

            // Update characters counter [sf]
            WriteXY(CounterX1, CounterY1, CClr, PadLt(Int2Str(Length(IBuf)), 3, '0'))
            WriteXY(CounterX2, CounterY2, CClr, PadLt(Int2Str(IMaxBuffer), 3, '0'))
        End
        GoToXy(PromptX,PromptY)
    Until Done
End

// Clear screen
Procedure DoCls
Var X : Integer = 0
Begin
    For X:=1 To CLBuffer Do
        ChatLines[X]:=''
    RedrawScreen
End

Procedure DoScrollBack
Begin
    //MenuCmd('GV','mrcscrl;x;y;'+ChatLog+';END')
    MenuCmd('GV','mrcscrl;'+ChatLog+' /end')
    RedrawScreen
End

Procedure ShowWelcome
Begin
    // Welcome info text [sf]
    Add2Chat('* |10Welcome to ' + MRCVersion)
    Add2Chat('* |15ESC|10 to clear input buffer, |15UP|10/|15DN|10 arrows for buffer history')
    Add2Chat('* |15PGUP|10/|15PGDN|10 to change your chat text color and |15TAB|10 for nick completion')
    Add2Chat('* |10The bottom-right heartbeat indicates your status with BBS and server')
    Add2Chat('* |10Your maximum message length is |15' + Int2Str(IMaxBuffer)+ '|10 characters')
    ShowChat(0)
End

Procedure ShowChanges
Begin
    // Changes info text [sf]
    Add2Chat('* |15List of changes from MRC v1.1')
    Add2Chat('* |10Completely redesigned Input routine [sf]')
    Add2Chat('* |10Ability to receive chat while typing (non-blocking) [sf]')
    Add2Chat('* |10Built-in input buffer history [sf]')
    Add2Chat('* |10Chat text color changing using PgUp and PgDn [sf]')
    Add2Chat('* |10Visual indicator when your nick is mentioned [sf]')
    Add2Chat('* |10Input buffer with color coded characters counter [sf]')
    Add2Chat('* |10Server latency and synchronization heartbeat indicator [sf]')
    Add2Chat('* |10Enlarged view port, more lines are available for the chat [sf]')
    Add2Chat('* |10Customizable information scroller [sf]')
    Add2Chat('* |10Improvement of performance and responsiveness of the interface [sf]')
    Add2Chat('* |10Brand new backend for improved speed and scalability [sf]')
    Add2Chat('* |10Nick auto-completion using TAB [sf]')
    Add2Chat('* |10Reply to last private message using /r [sf]')
    Add2Chat('* |10Add |12t|04rOUt |12s|04lAp|10 using |12/trout|10 [mL]')
    Add2Chat('* |10Add |14r|06Ot|131|053 |10encoding using |12/rot13|10 [mL]')
    //Add2Chat('* |10')
    ShowChat(0)
End


Procedure EnterChat
Begin
    ShowWelcome   // Show welcome text [sf]

    Add2Chat(UpdateStrings(Plyr.EnterChatMe,Plyr.Name,'',MyRoom,MyRoom))
    SendToAllNotMe(UpdateStrings(Plyr.EnterChatRoom,Plyr.Name,'',MyRoom,MyRoom))

    Delay(20)
    SendToServer('IAMHERE')
    Delay(20)
    SendToServer('BANNERS')
    ShowChat(0)
End

Procedure LeaveChat
Var Str1    : String = ''
Begin
    Add2Chat(UpdateStrings(Plyr.LeaveChatMe,Plyr.Name,'',MyRoom,MyRoom))
    SendToAllNotMe(UpdateStrings(Plyr.LeaveChatRoom,Plyr.Name,'',MyRoom,MyRoom))
    ShowChat(0)
    Delay(500)
    SendToServer('LOGOFF');
    ShowChat(0)
End

Procedure DoSetList
Var R,S,T  : String = ''
Var B      : Boolean = False
Begin
    S:='False'
    If Plyr.UseClock Then
        S:='True'

    T:='False'
    If Plyr.ShowSmilies Then
        T:='True'

    R:='12Hour (HH:MMa or HHMMp)'
    If Not Plyr.ClockFormat Then
        R:='24Hour (HH:MM)'

    B:=Plyr.UseClock
    Plyr.UseClock:=False
    Add2Chat('|11List of current |15/SET |11values from your account')
    Add2Chat('|15ENTERCHATME   |08:|07 '+Plyr.EnterChatMe)
    Add2Chat('|15ENTERCHATROOM |08:|07 '+Plyr.EnterChatRoom)
    Add2Chat('|15ENTERROOMME   |08:|07 '+Plyr.EnterRoomMe)
    Add2Chat('|15ENTERROOMROOM |08:|07 '+Plyr.EnterRoomRoom)
    Add2Chat('|15LEAVECHATME   |08:|07 '+Plyr.LeaveChatMe)
    Add2Chat('|15LEAVECHATROOM |08:|07 '+Plyr.LeaveChatRoom)
    Add2Chat('|15LEAVEROOMME   |08:|07 '+Plyr.LeaveRoomMe)
    Add2Chat('|15LEAVEROOMROOM |08:|07 '+Plyr.LeaveRoomRoom)
    Add2Chat('|15DEFAULTROOM   |08:|07 '+Plyr.DefaultRoom)
    Add2Chat('|15NICKCOLOR     |08:|07 '+Plyr.NameColor+Plyr.Name)
    Add2Chat('|15LTBRACKET     |08:|07 '+Plyr.LtBracket)
    Add2Chat('|15RTBRACKET     |08:|07 '+Plyr.RtBracket)
    Add2Chat('|15USECLOCK      |08:|07 '+S)
    Add2Chat('|15CLOCKFORMAT   |08:|07 '+R)
    Add2Chat('|15SHOWSMILIES   |08:|07 '+T+ '   |08(under construction)|07')
    ShowChat(0)
    Plyr.UseClock:=B
End

Procedure DoSetHelp
Var B    : Boolean = False
Begin
    B:=Plyr.UseClock
    Plyr.UseClock:=False
    Add2Chat('|15/SET |08<|03tag|08> <|03text|08>')
    Add2Chat('|11Use |15SET |11to set various fields to your account')
    Add2Chat('|15HELP            |03This helps message')
    Add2Chat('|15LIST            |03List all fields and tabs')
    Add2Chat('|15ENTERCHATME     |03Displayed to |11me |03when I enter chat.')
    Add2Chat('|15ENTERCHATROOM   |03Displayed to |11room |03when I enter chat.')
    Add2Chat('|15ENTERROOMME     |03Displayed to |11me |03when I enter room.' )
    Add2Chat('|15ENTERROOMROOM   |03Displayed to |11room |03when I enter room.' )
    Add2Chat('|15LEAVECHATME     |03Displayed to |11me |03when I leave chat.' )
    Add2Chat('|15LEAVECHATROOM   |03Displayed to |11room |03when I leave chat.' )
    Add2Chat('|15LEAVEROOMME     |03Displayed to |11me |03when I leave room.')
    Add2Chat('|15LEAVEROOMROOM   |03Displayed to |11room |03when I leave room.')
    Add2Chat('|15DEFAULTROOM     |03Join this room when you join chat.')
    Add2Chat('|15NICKCOLOR       |03Change my nickname color |11(MCI Pipe codes).' )
    Add2Chat('|15LTBRACKET       |03Change my left bracket / color |11(MCI Pipe codes).' )
    Add2Chat('|15RTBRACKET       |03Change my right bracket / color |11(MCI Pipe codes).' )
    Add2Chat('|15USECLOCK        |03(|15Y|03/|15N|03) Use timestamp in chat')
    Add2Chat('|15CLOCKFORMAT     |1112 |03or |1124 |03hour clock format')
    Add2Chat('|15SHOWSMILIES     |03Convert smilies into ANSI smilies (under construction)')
    ShowChat(0)
    Plyr.UseClock:=B
End

Procedure ChangeClock(T:Integer;S:String)
Begin
    S:=StripB(Upper(S),' ')
    Case T Of
        1: Begin
            If Pos('YE',S) > 0 Or Pos('TR',S) > 0 Then Begin
                Plyr.UseClock:=True
                Add2Chat('|11CLOCKFORMAT   |08: |15True')
            End Else Begin
                If Pos('NO',S) > 0 Or Pos('FA',S) > 0 Then Begin
                    Plyr.UseClock:=False
                    Add2Chat('|11CLOCKFORMAT   |08: |15False')
                End Else
                    Add2Chat('|11Usage: |15/SET USECLOCK YES||TRUE|08 or |15/SET USECLOCK NO||FALSE')
            End
            ShowChat(0)
        End
        2: Begin
            If S = '12' Then Begin
                Plyr.ClockFormat:=True
                Add2Chat('|07CLOCKFORMAT   |08: |0712 hour')
            End Else Begin
                If S = '24' Then Begin
                    Plyr.ClockFormat:=False
                    Add2Chat('|07CLOCKFORMAT   |08: |0724 hour')
                End Else
                    Add2Chat('|11Usage: |08"|03/SET CLOCKFORMAT 12|08" or "|03/SET CLOCKFORMAT 24|08"')
            End
            ShowChat(0)
         End
    End
    SavePlyr(Plyr.RecIdx)
End

Procedure ChangeSmilies(T:Integer;S:String)
Begin
    S:=StripB(Upper(S),' ')
    Case T Of
        1: Begin
            If Pos('YE',S) > 0 Or Pos('TR',S) > 0 Then Begin
                Plyr.ShowSmilies:=True
                Add2Chat('|11SHOWSMILIES   |08: |15True')
            End Else Begin
                If Pos('NO',S) > 0 Or Pos('FA',S) > 0 Then Begin
                    Plyr.ShowSmilies:=False
                    Add2Chat('|11SHOWSMILIES   |08: |15False')
                End Else
                    Add2Chat('|11Usage: |15/SET SHOWSMILIES YES||TRUE|08 or |15/SET SHOWSMILIES NO||FALSE')
            End
            ShowChat(0)
        End
    End
    SavePlyr(Plyr.RecIdx)
End

Procedure DoSet(Line:String)
Var Tag,Txt : String = ''
Var P       : Integer = 0
Begin
    Tag:=WordGet(1,Line,' ')
    P:=Length(Tag)+1
    Delete(Line,1,P)
    StripB(line,' ')

    Case Upper(Tag) Of
        'HELP': DoSetHelp
        'LIST': DoSetList
        'ENTERCHATME'   : Plyr.EnterChatMe:=Line
        'ENTERCHATROOM' : Plyr.EnterChatRoom:=Line
        'ENTERROOMME'   : Plyr.EnterRoomMe:=Line
        'ENTERROOMROOM' : Plyr.EnterRoomRoom:=Line
        'LEAVECHATME'   : Plyr.LeaveChatMe:=Line
        'LEAVECHATROOM' : Plyr.LeaveChatRoom:=Line
        'LEAVEROOMME'   : Plyr.LeaveRoomMe:=Line
        'LEAVEROOMROOM' : Plyr.LeaveRoomRoom:=Line
        'DEFAULTROOM'   : Plyr.DefaultRoom:=Line
        'NICKCOLOR'     : ChangeNick('C',Line,False)
        'LTBRACKET'     : ChangeNick('L',Line,False)
        'RTBRACKET'     : ChangeNick('R',Line,False)
        'USECLOCK'      : ChangeClock(1,Line)
        'CLOCKFORMAT'   : ChangeClock(2,Line)
        'SHOWSMILIES'   : ChangeSmilies(1,Line)
        ''              : DoSetHelp
    End
    SavePlyr(Plyr.RecIdx)
End

Procedure DLChatLog
Var X,Y,TS,DS,TempChat : String = ''
Var fptr               : File
Begin
    DS:=Replace(DateStr(DateTime,1),'/','')
    TS:=Replace(TimeStr(DateTime,False),':','')
    TempChat:=CfgTempPath+'mrc_chat_'+Replace(SiteTag,' ','_')+'_'+DS+'_'+TS+'.log'
    Write('|16|11|CL')
    If InputYN('Strip MCI color codes? ') Then Begin
        fAssign(fptr,ChatLog,66)
        fReset(Fptr)
        While Not fEof(Fptr) Do Begin
            fReadLn(Fptr,X)
            Y:=StripMCI(X)
            AppendText(TempChat,Y)
        End
        fClose(Fptr)
    End Else
        FileCopy(ChatLog,TempChat)
    MenuCmd('F3',TempChat);
    FileErase(TempChat)
    RedrawScreen;
End

Procedure Main
Var Done       : Boolean = False
Var RestOfLine : String = ''
Var W1,W2,UIL  : String = ''
Var IL         : String = ''
Begin
    Loop:=1
    UpdateScreen
    Repeat
        Delay(10)
        IL:=InputLine

        // Support slash commands even if prefixed with a PIPE code
        If Pos('/',StripMCI(IL)) = 1 Then Begin
            W1:=Upper(WordGet(1,StripMCI(IL),' '))
            W2:=WordGet(2,IL,' ')
            RestOfLine:=IL
            Delete(RestOfLine,1,Length(W1))
            RestOfLine:=StripB(RestOfLine,' ')

            Case W1 Of
                '/CHANGES'   : ShowChanges  // Display changes [sf]
                '/?'         : DoHelp
                '/B'         : DoBroadcast(IL)
                '/BBSES'     : SendToServer('CONNECTED')
                '/CHANNEL'   : SendToServer('CHANNEL')
                '/CHATTERS'  : SendToServer('CHATTERS')
                '/CLS'       : DoCls
                '/DLCHATLOG' : DLChatLog
                '/JOIN'      : JoinRoom(W2,True)
                '/LIST'      : SendToServer('LIST')
                '/ME'        : DoMeAction(IL)
                '/TROUT'     : DoTroutAction(IL)
                '/Q','/QUIT' :
                    Begin
                        LeaveChat
                        Done := True
                    End
                '/ROOMS'     : SendToServer('LIST')
                '/SCROLL'    : DoScrollBack
                '/SET'       : DoSet(RestOfLine)
                '/TOPIC'     : ChangeTopic(RestOfLine)
                '/T','/MSG','/M',
                '/TELL'      : DoPrivateMsg(IL)
                '/USERS'     : SendToServer('USERS')
                '/WHO'       : DoWho
                '/WHOON'     : SendToServer('WHOON')
                '/MOTD'      : SendToServer('MOTD')
                '/HELP'      : SendToServer('HELP')
                '/INFO'      : SendToServer('INFO '+W2)
                '/QUOTE'     : SendToServer(RestOfLine)
                '/VERSION'   :
                    Begin
                        SendToServer('VERSION')
                        Add2Chat('|07- |13'+MRCVersion)
                    End
            End
        End Else Begin
            If Length(IL) > 0 Then
            Begin
                IL:=Replace(IL, '~', ' ')
                SendToRoom(MyNamePrompt+GetPipe(CIdx)+IL)
            End
        End
    Until Done
End

Begin
    CleanOut
    GetThisUser


    // Check if we toggle the NodeMsgFlag
    If ACS('OA') Then
    Begin
        NodeMsgFlag:=True
        MenuCmd('GE', '18')
    End

    Init
    RedrawScreen
    EnterChat
    JoinRoom(Plyr.DefaultRoom,False)
    LoadBanners
    NextBanner
//    ScrollBanner
    Main
    Write('|16|11|CL')

    // Reset the NodeMsgFlag if changed
    If NodeMsgFlag Then
        MenuCmd('GE', '18')

    CleanOut
    Halt

End

