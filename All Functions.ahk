#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;; ================================ ;;
;; ========== FUNCTIONS =========== ;;
;; ================================ ;;

HideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
}

OpenPasskey(){
   Sendinput, !e
   sleep 30
   ;MsgBox, input alt + e
   Sendinput, s
   sleep 500
   Sendinput, ^f
   sleep 30
   Sendinput, Passwords
}


RenameTemplate(){
   Sendinput, {F2}
   sleep 20
   Sendinput, ^c
   sleep 20
   Sendinput,{click}{click}
   sleep 100
   Sendinput, ^+2
   sleep 100
   Send {Right}{Right}{Right} ; Enter pS
   sleep 100
   Sendinput, {Enter}
   sleep 100
   Send, {Down}
   sleep 100
   ;MsgBox, input presses righty
   Sendinput, {F2}
   sleep 100
   Sendinput, ^v
   sleep 100
   Sendinput, {Enter}
   sleep 300
   Sendinput, {Backspace}
   sleep 300
   Sendinput, {Left} ; Enter pR
   sleep 150
   Sendinput, {Enter}
   sleep 100
   Send, {Down}
   sleep 100
   ;MsgBox, input presses righty
   Sendinput, {F2}
   sleep 100
   Sendinput, ^v
   sleep 100
   Sendinput, {Enter}
   sleep 300
   Sendinput, {Backspace}
   sleep 300
   Sendinput, {Left}{Left}
   sleep 150
   Sendinput, {Enter}
   sleep 100
   Send, {Down} ; enter Ableton
   sleep 100
   ;MsgBox, input presses righty
   Sendinput, {F2}
   sleep 100
   Sendinput, ^v
   sleep 100
   Sendinput, {Enter}
   sleep 100
   Sendinput, {Backspace}
}

preset(item){

   keywait, %A_PriorHotKey% 
   ifWinNotActive ahk_exe Adobe Premiere Pro.exe 
      {
         goto theEnding   
      }

   coordmode, pixel, Window
   coordmode, mouse, Window
   coordmode, Caret, Window

   BlockInput, SendAndMouse
   BlockInput, MouseMove
   BlockInput, On
   SetKeyDelay, 0 
   Sendinput, ^!+k ;ASSIGN "shuttle stop"
   sleep 100
   Sendinput, ^!+k
   sleep 50

   ;msgbox, ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%

   MouseGetPos, xposP, yposP 
   sendinput, {mButton} 
   sleep 50

   Sendinput, ^+!7 ;CTRL SHIFT ALT 7 ---find the "Effects" panel
   sleep 100

   Sendinput, ^b ;CTRL B ----"select find box"
   sleep 50

   if (A_CaretX = "")
   {
      waiting2 = 0

      loop
         {
         waiting2 ++
         sleep 33
         tooltip, counter = (%waiting2% * 33)`nCaret = %A_CaretX%
         if (A_CaretX <> "")
            {
            tooltip, CARET WAS FOUND
            break
            }
         if (waiting2 > 40)
            {
            tooltip, FAIL - no caret found. `nIf your cursor will not move`, hit the button to call the preset() function again.`nTo remove this tooltip`, refresh the script using its icon in the taskbar.`n`nIt's possible Premiere tried to AUTOSAVE at just the wrong moment!
            ;sleep 200
            ;tooltip,

            sleep 20
            GOTO theEnding
            }
         }
      sleep 1
      tooltip,
   }

   ; this go all the way up to "8," which is 264 milliseconds

   MouseMove, %A_CaretX%, %A_CaretY%, 0 ;this moves the cursor, instantly, to the position of the caret.
  
   sleep 5
   ;tooltip, 1 - mouse should be on the caret X= %A_CaretX% Y= %A_CaretY% now
   ;;;msgbox, caret X Y is %A_CaretX%, %A_CaretY%

   MouseGetPos, , , Window, classNN
   WinGetClass, class, ahk_id %Window%

   ;tooltip, 2 - ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%

   ControlGetPos, XX, YY, Width, Height, %classNN%, ahk_class %class%, SubWindow, SubWindow 

   ;tooltip, classNN = %classNN%
   ;MsgBox, xx=%XX% yy=%YY%

   ;MouseMove, XX-25, YY+10, 0 ;--------------------for 150% UI scaling, this moves the cursor onto the magnifying glass

   MouseMove, XX-12, YY+6, 0 ;--------------------for 100% UI scaling, this moves the cursor onto the magnifying glass

   ;msgbox, should be in the center of the magnifying glass now. 
   sleep 5

   Sendinput, %item% 
   sleep 5

   ;MouseMove, 62, 95, 0, R ;----------------------(for 150% UI.)

   MouseMove, 41, 63, 0, R ;----------------------(for 100% UI)
   ;msgbox, The cursor should be directly on top of the preset's icon
   ;`n If not, the script needs modification.
   sleep 5

   MouseGetPos, iconX, iconY, Window, classNN 
   sleep 5
   
   WinGetClass, class, ahk_id %Window% ;----------"ahk_id %Window%" is important for SOME REASON.
   ;tooltip, ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%
   ;sleep 50

   ControlGetPos, xxx, yyy, www, hhh, %classNN%, ahk_class %class%, SubWindow, SubWindow 
   
   MouseMove, www/4, hhh/2, 0, R ;-----------------moves to roughly the CENTER of the Effects panel.
   sleep 5
   
   MouseClick, left, , , 1 ;-----------------------the actual click
   sleep 5
   
   MouseMove, iconX, iconY, 0 ;--------------------moves cursor BACK onto the preset's icon
   ;tooltip, should be back on the preset's icon
   sleep 5


   MouseClickDrag, Left, , , %xposP%, %yposP%, 0 
   sleep 5
   
   MouseClick, middle, , , 1
   blockinput, MouseMoveOff ;returning mouse movement ability
   BlockInput, off ;do not comment out or delete this line -- or you won't regain control of the keyboard!! However, CTRL ALT DELETE will still work if you get stuck!!
   theEnding:
}

reachEffectsBox(){

   Sendinput, ^+!7 
  
   sleep 15

   Sendinput, ^b
}