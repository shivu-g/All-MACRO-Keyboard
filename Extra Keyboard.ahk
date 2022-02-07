
#NoEnv
SendMode Input
#InstallKeybdHook
;#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000


#if (getKeyState("F23", "P")) ;<--Everything after this line will only happen on the secondary keyboard that uses F23.
F23::return ;this line is mandatory for proper functionality

escape::tooltip, [F23] You might wish to not give a command to escape. Could cause problems. IDK.
;escape::return ;<--to disable a key, just use a "return," like so.

F1::msgbox, you pressed F1 on the extra keyboard
F2::
SoundBeep, 900, 400
tooltip, you pressed F2 AND get a beep sound!
return
F3:: ;tooltip, you pressed F3 but do not get a beep.
F4::
F5::
F6::
F7::
F9::
F8::
F10::
F11::
F12::tooltip, you pressed the function key %A_thishotkey% on the [F23] keyboard

;;------------------------NEXT ROW--------------------------;;

`::
1::
2::
3::
4::
5::
6::
7::
8::
9::preset("05_Zoom In - 7%")
0::preset("07_Zoom In - Slightly")
-::preset("03_Movie Zoom In")
=::preset("01_Zoom In")
backspace::Send, ^z ;tooltip, [F23]  %A_thishotKey%

;;------------------------NEXT ROW--------------------------;;

tab::tooltip, [F23]  %A_thisHotKey%
q::
w::coolFunction("Hello World. From W")
e::
r::
t::
y::
u::
i::
o::
p::preset("Lightning Flashes")
[::preset("Neon Flickering")
]::preset("Noise Split")

;;capslock::tooltip, [F23] capslock - this should have been remapped to F20. Don't use this line.

;;------------------------NEXT ROW--------------------------;;

a::
s::
d::
f::
g::
h::
j::
K::
l::Send, ^!+g ; Global FX Mute
`;::preset("Normal - Smooth Motion")  ;tooltip, [F23]  %A_thisHotKey%
;for the above line, (semicolon) note that the ` is necessary as an escape character -- and that the syntax highlighting might get it wrong.
'::preset("Tele - Smooth Motion")  ;tooltip, [F23]  %A_thisHotKey%
\::preset("Super Tele - Smooth Motion")  ;tooltip, [F23]  %A_thisHotKey%
enter::reachEffectsBox()

;;------------------------NEXT ROW--------------------------;;

z::
x::
c::
v::
b::
n::
m::
,::
.::preset("Gaussian Blur Preset")
/::preset("Rotate -90") ;tooltip, [F23]  %A_thishotKey%

space::Suspend 
;;And THAT^^ is how you do multi-line instructions in AutoHotkey.
;;Notice that the very first line, "space::" cannot have anything else on it.
;;Again, these are fundamentals that you should have learned from the tutorial.


;;===================== MODIFIERS =========================;;

;;Keep these commented out, as they are!
;Lshift::tooltip, do not use
;Lctrl::tooltip, do not use
;Lwin::tooltip, do not use
;Lalt::tooltip, do not use

;Ralt::tooltip, do not use
;Rwin::tooltip, do not use
;Rctrl::Winset, Alwaysontop, , A 
;Rshift::tooltip, do not use


;;If you leave the modifier keys alone, it allows for lines like the ones below:
;+z::tooltip, you pressed SHIFT Z on the F23 keyboard.
;^z::tooltip, you pressed CTRL Z on the F23 keyboard.
;!z::tooltip, you pressed ALT Z on the F23 keyboard. I don't recommend this... ALT is dangerous because of menu acceleration, even if you try to disable it like I have
;^!z::tooltip, you pressed CTRL SHIFT Z on the F23 keyboard.
;;Etc.
;;However, I use few to no modifiers on my secondary keyboards... I prefer tap dance instead. The decision is up to you.


;;================= MODIFIERS REMAPPED ======================;;

SC070::tooltip, [F23] Lshift -to-> SC070-International 2
SC071::tooltip, [F23] LCtrl -to-> SC071-Language 2
SC072::tooltip, [F23] LWin -to-> SC072-Language 1
SC073::tooltip, [F23] LAlt -to-> SC073-International 1

SC077::tooltip, [F23] RAlt -to-> SC077-Language 4
SC078::tooltip, [F23] RWin -to-> SC078-Language 3
SC079::tooltip, [F23] AppsKey -to-> SC079-International 4
SC07B:: Send, ^r ;RENAME CLIPS ABLETON ;tooltip, [F23] RCtrl -to-> SC07B-International 5
SC07D:: Send, P ; SET MARKER ABLETON; tooltip, [F23] RShift -to-> SC07D-International 3

;;================= LOCKING KEYS ======================;;

F20::tooltip, [F23] CapsLock -to-> SC06B-F20
SC145::run, C:\Users\aayus\Documents\#04 - Reference Tracks ;NumLock

;;================= NEXT SECTION ======================;;

PrintScreen:: run,C:\Users\aayus\Documents\Macro Stuff ;tooltip, [F23] %A_thishotKey%+

 ;;================= LOCKING KEYS ======================;;

 SC061::RenameTemplate() ; ScrollLock

; ;;================= NEXT SECTION ======================;;

;; RX8 stuff

insert::Send, ^!+1 ;No Vocal // Music Rebalance Preset
delete::Send, ^c ; COPY
home::Send, ^+W ;Close All Files
end::Send, ^!+o ;Save Overwrite 

pgup::Send, {Right}{Enter} ; helpful for closing all :: step 2
pgdn::Send, ^v ; PASTE

;;================= NEXT SECTION ======================;;

;ABLETON --> SECTION
up:: Send, {Click, Right}{Down}{Down}{Enter} ; Show Automation In New Lane
down::Send, ^e ; Split
left::Send, ^l ; Looping Part
right::Send, {BackSpace} ; Delete

;;================== THE NUMPAD ======================;;

; AllOff:
; Hotkey, numpad1, Off
; Hotkey, numpad2, Off
; Hotkey, numpad3, Off
; Hotkey, numpad4, Off
; Hotkey, numpad5, Off
; Hotkey, numpad6, Off
; Hotkey, numpad7, Off
; Hotkey, numpad8, Off
; Hotkey, numpad9, Off

numpad0::
InputBox, DirectoryName, Set Active Project Folder, Enter Active Project Folder:, , 300, 130, , , , ,%DirectoryName%

; if (ErrorLevel = 1){  ;Checks if pressed Esc/Cancel
; 	return
; }
; else if FileExist(DirectoryName) {  ;Validity of Path
; 	MsgBox, , Active Folder Set, Active Folder: %DirectoryName%, 2
; 	Hotkey, numpad1, On
; 	Hotkey, numpad2, On
; 	Hotkey, numpad3, On
; 	Hotkey, numpad4, On
; 	Hotkey, numpad5, On
; 	Hotkey, numpad6, On
; 	Hotkey, numpad7, On
; 	Hotkey, numpad8, On
; 	Hotkey, numpad9, On
; 	return
; }
; else if (DirectoryName = "") {  ;if path entered is VOID
; 	MsgBox, , Hotkeys OFF, Entry Field Blank., 2
; 	gosub, AllOff
; 	return
; }
; else {  ;runs if entered something, but not valid path
; 	gosub, AllOff
; 	return
; }

numpad1::
if FileExist(DirectoryName "/01 - ABLETON PROJECT")
	run, %DirectoryName%/01 - ABLETON PROJECT
	return
numpad2::
if FileExist(DirectoryName "/02 - FOOTAGE")
	run, %DirectoryName%/02 - FOOTAGE
	return
numpad3::
if FileExist(DirectoryName "/03 - PREMIERE PRO")
	run, %DirectoryName%/03 - PREMIERE PRO
	return
numpad4::
if FileExist(DirectoryName "/04 - PHOTOSHOP")
	run, %DirectoryName%/04 - PHOTOSHOP
	return
numpad5::
if FileExist(DirectoryName "/05 - ASSETS")
	run, %DirectoryName%/05 - ASSETS
	return
numpad6::
if FileExist(DirectoryName "/06 - EXPORTS")
	run, %DirectoryName%/06 - EXPORTS
	return
numpad7::run, C:\Users\aayus\Documents\#01- Projects\#ONGOING
numpad8::run, C:\Users\aayus\Documents\#02 - Sound_Packs
numpad9::run, C:\Users\aayus\Documents\#03 - Visual_Packs

;;NumLock::tooltip, DO NOT USE THIS IN YOUR 2ND KEYBOARD!

numpadDiv::run, C:\Users\aayus\Documents\#05 - Guitar Presets Pack
numpadMult::run, C:\Users\aayus\Downloads
numpadSub::HideShowTaskbar(hide := !hide)
numpadAdd::Reload
numpadEnter::Winset, Alwaysontop, , A
numpadDot:: ;; COPY FILE PATH
#IfWinActive ahk_class CabinetWClass ; If Windows Explorer window is active
SendInput, ^c
Sleep 100
Clipboard := Clipboard
Return

#IfWinActive


#if 
