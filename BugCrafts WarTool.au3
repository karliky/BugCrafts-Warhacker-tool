#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.0.0
 Author:         BugCraft (Also Karliky) karliky@gmail.com	

    <ADT Class | An "Autoit Script" made for change some things into WarHammer>
    Copyright (C) <2010>  <BugCraft> Also Karliky (karliky@gmail.com)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Note about the Author:
Please don't use this app to obtain benefits better than other players
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#ce ----------------------------------------------------------------------------

;===============================================================================
;Includes
;===============================================================================
#RequireAdmin

#include <functions.au3>
#include <nomadmemory.au3>
#include <GDIPlus.au3>
#include <misc.au3>
#include <guilistbox.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <GuiConstantsEx.au3>
SetPrivilege("SeDebugPrivilege", 1)

$DLL = DllOpen("user32.dll")
Global $Proceso = _MemoryOpen(ProcessExists("war.exe"))

#include <offsets.au3>
;===============================================================================
;Funciones
;===============================================================================
Global $State_Speed = 0,$State_Fly = 0,$State_SuperJump = 0,$State_Transparency = 0,$State_Ninja = 0,$LastPos = "9900990"
;===============================================================================
;Funciones
;===============================================================================
	HotKeySet("{F1}","PlayerScale")
	HotKeySet("{F2}","PlayerZPosition")
	HotKeySet("{F3}","PlayerXPosition")
	HotKeySet("{F4}","PlayerYPosition")
	HotKeySet("{F5}","Speedhack")
	HotKeySet("{F6}","SuperJump")
	HotKeySet("{F7}","Fly")
	HotKeySet("{F8}","Ninja")
	HotKeySet("{F9}","Transparency")
	HotKeySet("{F10}","CameraZ")
	HotKeySet("{F11}","CameraDist")
	


;===============================================================================
;USER INTERFACE
;===============================================================================	
_GDIPlus_Startup()
$BackGround = "images/gui.png"
$Image_Handle = _GDIPlus_ImageLoadFromFile($BackGround)
$Width = _GDIPlus_ImageGetWidth($Image_Handle)				
$Height = _GDIPlus_ImageGetHeight($Image_Handle)				
$GUI = GUICreate("BugCraft's WarHacker Tool", $Width, $Height,-1,-1, $WS_POPUP, $WS_EX_LAYERED)

SetBitmap($GUI, $Image_Handle, 0)
GUIRegisterMsg($WM_NCHITTEST, "WM_NCHITTEST")
GUISetState()
For $i = 0 To 255 Step 10
    SetBitmap($GUI, $Image_Handle, $i)
Next

$controlGui = GUICreate("ControlGUI", $Width, $Height,0, 0, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $GUI)
GUICtrlCreatePic("images/grey.gif", 0, 0, $Width, $Height)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetColor(-1, 0xFFFFFF)
;=====================================================
$List_Information = GUICtrlCreateList("", 16, 88, 321, 84,BitOR($WS_VSCROLL,$WS_BORDER,$LBS_NOSEL,$LBS_DISABLENOSCROLL ))
GUICtrlSetLimit(-1, 9999)
Global $Button_Speed = GUICtrlCreateCheckbox("Speed Hack",352, 88, 81, 17,bitor($BS_PUSHLIKE,$BS_FLAT))
GUICtrlSetBkColor(-1,0xffffff)
Global $Button_Jump = GUICtrlCreateCheckbox("Super Jump", 352, 104, 81, 17,bitor($BS_PUSHLIKE,$BS_FLAT))
GUICtrlSetBkColor(-1,0xffffff)
Global $Button_Fly = GUICtrlCreateCheckbox("Fly", 352, 120, 81, 17,bitor($BS_PUSHLIKE,$BS_FLAT))
GUICtrlSetBkColor(-1,0xffffff)
Global $Button_Transparency = GUICtrlCreateCheckbox("Transparency", 352, 136, 81, 17,bitor($BS_PUSHLIKE,$BS_FLAT))
GUICtrlSetBkColor(-1,0xffffff)
Global $Button_Ninja = GUICtrlCreateCheckbox("Ninja!", 352, 152, 81, 17,bitor($BS_PUSHLIKE,$BS_FLAT))
GUICtrlSetBkColor(-1,0xffffff)
Global $Label_Health = GUICtrlCreateLabel("Health", 16, 64, 35, 17)
GUICtrlSetBkColor(-1,0xffffff)
Global $Label_Energy = GUICtrlCreateLabel("Energy", 192, 64, 37, 17)
GUICtrlSetBkColor(-1,0xffffff)
Global $Progress_Health = GUICtrlCreateProgress(56, 64, 105, 17)
Global $Progress_Energy = GUICtrlCreateProgress(232, 64, 105, 17)
;=====================================================
GUISetState()

Update_List("Welcome to BugCraft's WarTool")
Update_List("Check out for new updates http://www.nogg-aholic.es")
Update_List("")
Update_List("Have fun! ._ .")

While 1
	;LoopFuntions
		if (GUICtrlRead($Button_Fly) == 1) Then
			if _IsPressedKey("20") Then
				_MemoryWrite($Player_FlyUP, $Proceso,900, 'float')
			EndIf
		EndIf
		if (GUICtrlRead($Button_Jump) == 1) Then
			_MemoryWrite($Player_SuperJump, $Proceso,900, 'float')
		EndIf
		
		GUICtrlSetData($Progress_Health,_MemoryRead($Player_Health, $Proceso, 'Int')*100/_MemoryRead($Player_Health_Actual, $Proceso, 'int'))
		GUICtrlSetData($Progress_Energy,_MemoryRead($Player_Energy, $Proceso, 'Int')*100/_MemoryRead($Player_Energy_Actual, $Proceso, 'int'))
	;
	$nMsg = GUIGetMsg()
	
	Switch $nMsg
		
		case $Button_Speed
			Speedhack()
		case $Button_Fly
			Fly()
		case $Button_Jump
			SuperJump()
		case $Button_Ninja
			Ninja()
		Case $GUI_EVENT_CLOSE
		Exit
		
	EndSwitch
WEnd
