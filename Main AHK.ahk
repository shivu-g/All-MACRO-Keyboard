#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; # -> Windows Key
; ! -> Alt Key
; ^ -> Control Key
; + -> Shift Key

#SingleInstance force

#Include, C:\Users\aayus\Documents\Macro Stuff\All Functions.ahk
#Include, C:\Users\aayus\Documents\Macro Stuff\Extra Keyboard.ahk

;; ================================ ;;
;; ================================ ;;


; ^F10::Pause ; Pauses the Script  !!!!! PROBLEM !!!!!!

;^F10::RenameTemplate()

^F11:: HideShowTaskbar(hide := !hide)

^F12::Reload

;; ================================ ;;
;; ======= Utility - s ============ ;;
;; ================================ ;;



;; ================================ ;;
;; ======= E - MAIL IDs =========== ;;
;; ================================ ;;

;SetKeyDelay, 0 !!! CHECK THIS

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx PERSONAL

;; ================================ ;;
;; ================================ ;;

;; ================================ ;;
;; ============ CHROME ============ ;;
;; ================================ ;;


#IfWinActive ahk_exe chrome.exe

   F1::Send, ^+{Tab} ; switches to LEFT active tabs

   F2::Send, ^{Tab} ; switches to RIGHT active tabs

   F3::Send, ^h ; Open History

   F4::Send, ^j ; Open Downloads

   F5::Send, ^w ; Close Current Tab

   F6:: OpenPasskey() ;Reach Passwords  !!!!! PROBLEM !!!!!!

return

;; ================================ ;;
;; ================================ ;;


;; ================================ ;;
;; ======== iZOTOPE RX 8 ========== ;;
;; ================================ ;;

#IfWinActive ahk_exe iZotope RX 8 Audio Editor.exe

   F1::Send, ^E ;Export Audio

   F2::Send, ^!S ;Save Overwrite 

   F3::Send, ^+W ;Close All Files

   F4::Send, {Right}{Enter} ; helpful for closing all :: step 2

return

;; ================================ ;;
;; ================================ ;;


;; ================================ ;;
;; ======== ABLETON LIVE ========== ;;
;; ================================ ;;

#IfWinActive ahk_exe Ableton Live 11 Suite.exe

   F1::Send, ^+R ;Export Music

   ^q::Send, ^l ; Looping Part

   ^w::Send, {BackSpace} ; delete key



return

;; ================================ ;;
;; ================================ ;;


;; ================================ ;;
;; =========== PHOTOSHOP ========== ;;
;; ================================ ;;

#IfWinActive ahk_exe Photoshop.exe

   F1::Send, !+^W ;Export Image

   ; F2 ==> Convert to Smart Object

   ; F3 ==>  Rasterize Layer

   ; F4 ==> Edit Contents

   F5::Send, ^j ;Copy Layer

   F6::Send, {BackSpace} ; Delete Layer

   F7::Send, ^!+e ; Merge Visible Layers
  

return

;; ================================ ;;
;; ================================ ;;

;; ================================ ;;
;; ========== PREMIERE PRO ======== ;;
;; ================================ ;;

#IfWinActive ahk_exe Adobe Premiere Pro.exe

F1:: preset("05_Zoom In - 7%")
F2:: preset("07_Zoom In - Slightly")
F3:: preset("Noise Split")
F4:: preset("Neon Flickering")
F5:: preset("Lightning Flashes")
F6:: preset("Normal - Smooth Motion")
F7:: preset("Tele - Smooth Motion")
F8:: preset("Super Tele - Smooth Motion")
F9:: reachEffectsBox()
F12::Send, ^m ;Export Video

;; ================================ ;;
;; ================================ ;;

