#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; The script will only trigger when a window with this name is open
window_name = ・lounge - Discord

press_once_message = welcome{!}{ENTER}
press_twice_message = welcome all{!}{ENTER}
press_thrice_message = :8screms:{ENTER}


~RControl::
if !WinExist(window_name)
{
    return
}

if (rctrl_presses > 0) ; SetTimer already started, so we log the keypress instead.
{
    rctrl_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
rctrl_presses := 1
SetTimer, Right_CTRL, -400 ; Wait for more presses within a 400 millisecond window.
return

Right_CTRL:
if (rctrl_presses = 1) ; The key was pressed once.
{
    send, press_once_message 
}
else if (rctrl_presses = 2) ; The key was pressed twice.
{
    send, press_twice_message 
}
else if (rctrl_presses > 2)
{
    send, press_thrice_message 
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
rctrl_presses := 0
return
