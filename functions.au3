;===============================================================================
;Update list
;===============================================================================
	Global $ListCount = 1
	Func Update_List($String)
		
		_GUICtrlListBox_AddString($List_Information,$String)
		$LAST = _GUICtrlListBox_GetCount($List_Information)

		_GUICtrlListBox_SetCaretIndex($List_Information,$LAST,True)
		$iIndex = _GUICtrlListBox_GetCaretIndex($List_Information)
		_GUICtrlListBox_SetCurSel($List_Information,$LAST-1)
		
		$ListCount = $ListCount + 1
	EndFunc

;===============================================================================
;SPEED HACK
;===============================================================================
	Func Speedhack()
	
		If $State_Speed == 0 Then
			GUICtrlSetState($Button_Speed,$GUI_CHECKED)
			_MemoryWrite($Player_Speed_Hack, $Proceso,5, 'float')
		$State_Speed = 1
		Update_List("SpeedHack enabled")
		Else
			GUICtrlSetState($Button_Speed,$GUI_UNCHECKED)
			_MemoryWrite($Player_Speed_Hack, $Proceso,1, 'float')
		$State_Speed = 0
		Update_List("SpeedHack disabled")
		EndIf

	EndFunc
;===============================================================================
;NINJA
;===============================================================================
	Func Ninja()
	
		If $State_Ninja == 0 Then
			GUICtrlSetState($Button_Ninja,$GUI_CHECKED)
			_MemoryWrite($Ninja_Mode, $Proceso,-9000, 'float')
		$State_Ninja = 1
		Update_List("Ninja enabled")
		Else
			GUICtrlSetState($Button_Ninja,$GUI_UNCHECKED)
			_MemoryWrite($Ninja_Mode, $Proceso,1, 'float')
		$State_Ninja = 0
		Update_List("Ninja disabled")
		EndIf

	EndFunc
;===============================================================================
;Fly HACK
;===============================================================================
	Func Fly()
	
		If $State_Fly == 0 Then
			GUICtrlSetState($Button_Fly,$GUI_CHECKED)
			_MemoryWrite($Player_Fly, $Proceso,1536, 'int')
			_MemoryWrite($Player_Fly1, $Proceso,2, 'int')
		$State_Fly = 1
		Update_List("Fly enabled")
		Else
			GUICtrlSetState($Button_Fly,$GUI_UNCHECKED)			
			
			_MemoryWrite($Player_Fly, $Proceso,1024, 'int')

			
		$State_Fly = 0
		Update_List("Fly disabled")
		EndIf

	EndFunc
;===============================================================================
;Super jump HACK
;===============================================================================
	Func SuperJump()
	
		If $State_SuperJump == 0 Then
			GUICtrlSetState($Button_Jump,$GUI_CHECKED)
			
		$State_SuperJump = 1
		Update_List("Super jump enabled")
		Else
			GUICtrlSetState($Button_Jump,$GUI_UNCHECKED)
			_MemoryWrite($Player_SuperJump, $Proceso,0, 'float')
		$State_SuperJump = 0
		Update_List("Super jump disabled")
		EndIf

	EndFunc

;===============================================================================
;PlayerScale HACK
;===============================================================================
		func PlayerScale()
		
		$Pos = MouseGetPos()
		if $LastPos == "9900990" Then
		Else
		if $Pos[1] == $LastPos Then
		Else
			if $Pos[1] > $LastPos Then
				$ScaleActual = _MemoryRead($Player_CONFG_Scale, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_Scale, $Proceso,$ScaleActual - 0.1, 'float')
				Update_List("Scale "&$ScaleActual - 0.1)
			Else				
				$ScaleActual = _MemoryRead($Player_CONFG_Scale, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_Scale, $Proceso,$ScaleActual + 0.1, 'float')
				Update_List("Scale "&$ScaleActual + 0.1)
			EndIf
		EndIf
		EndIf
		$LastPos = $Pos[1]
		
	EndFunc
;===============================================================================
;Player Z Position HACK
;===============================================================================
		func PlayerZPosition()
		
		$Pos = MouseGetPos()
		if $LastPos == "9900990" Then
		Else
		if $Pos[1] == $LastPos Then
		Else
			if $Pos[1] > $LastPos Then
				$ZActual = _MemoryRead($Player_CONFG_Z_Position, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_Z_Position, $Proceso,$ZActual + 10, 'float')
				Update_List("Position Z "&$ZActual + 10)
			Else				
				$ZActual = _MemoryRead($Player_CONFG_Z_Position, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_Z_Position, $Proceso,$ZActual -10, 'float')
				Update_List("Position Z "&$ZActual - 10)
			EndIf
		EndIf
		EndIf
		$LastPos = $Pos[1]
		
	EndFunc
;===============================================================================
;Player X Position HACK
;===============================================================================
		func PlayerXPosition()
		
		$Pos = MouseGetPos()
		if $LastPos == "9900990" Then
		Else
		if $Pos[1] == $LastPos Then
		Else
			if $Pos[1] > $LastPos Then
				$XActual = _MemoryRead($Player_CONFG_X_Position, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_X_Position, $Proceso,$XActual + 20, 'float')
				Update_List("Position x "&$XActual + 20)
			Else				
				$XActual = _MemoryRead($Player_CONFG_X_Position, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_X_Position, $Proceso,$XActual - 20, 'float')
				Update_List("Position x "&$XActual - 20)
			EndIf
		EndIf
		EndIf
		$LastPos = $Pos[1]
		
	EndFunc
;===============================================================================
;Player Y Position HACK
;===============================================================================
		func PlayerYPosition()
		
		$Pos = MouseGetPos()
		if $LastPos == "9900990" Then
		Else
		if $Pos[0] == $LastPos Then
		Else
			if $Pos[0] > $LastPos Then
				$YActual = _MemoryRead($Player_CONFG_Y_Position, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_Y_Position, $Proceso,$YActual - 20, 'float')
				Update_List("Position y "&$YActual - 20)
			Else				
				$YActual = _MemoryRead($Player_CONFG_Y_Position, $Proceso, 'float')
				_MemoryWrite($Player_CONFG_Y_Position, $Proceso,$YActual + 20, 'float')
				Update_List("Position y "&$YActual + 20)
			EndIf
		EndIf
		EndIf
		$LastPos = $Pos[0]
		
	EndFunc
;===============================================================================
;Camera Z
;===============================================================================
		func CameraZ()
		
		$Pos = MouseGetPos()
		if $LastPos == "9900990" Then
		Else
		if $Pos[1] == $LastPos Then
		Else
			if $Pos[1] > $LastPos Then
				$ZActual = _MemoryRead($Camera_Altitude, $Proceso, 'float')
				_MemoryWrite($Camera_Altitude, $Proceso,$ZActual - 20, 'float')
				Update_List("Camera Z "&$ZActual - 30)
			Else				
				$ZActual = _MemoryRead($Camera_Altitude, $Proceso, 'float')
				_MemoryWrite($Camera_Altitude, $Proceso,$ZActual + 20, 'float')
				Update_List("Camera Z "&$ZActual + 30)
			EndIf
		EndIf
		EndIf
		$LastPos = $Pos[1]
		
	EndFunc
;===============================================================================
;Camera Distance
;===============================================================================
		func CameraDist()
		
		$Pos = MouseGetPos()
		if $LastPos == "9900990" Then
		Else
		if $Pos[1] == $LastPos Then
		Else
			if $Pos[1] > $LastPos Then
				$ALTActual = _MemoryRead($Camera_Z, $Proceso, 'float')
				_MemoryWrite($Camera_Z, $Proceso,$ALTActual - 20, 'float')
				Update_List("Cam Altitude "&$ALTActual - 20)
			Else				
				$ALTActual = _MemoryRead($Camera_Z, $Proceso, 'float')
				_MemoryWrite($Camera_Z, $Proceso,$ALTActual + 20, 'float')
				Update_List("Cam Altitude "&$ALTActual + 20)
			EndIf
		EndIf
		EndIf
		$LastPos = $Pos[1]
		
	EndFunc
;===============================================================================
;Transparency
;===============================================================================
		func Transparency()
	
		If $State_Transparency == 0 Then
			GUICtrlSetState($Button_Transparency,$GUI_CHECKED)
			_MemoryWrite($Camera_Transparency, $Proceso,999999, 'float')
		$State_Transparency = 1
		Update_List("Transparency enabled")
		Else
			GUICtrlSetState($Button_Transparency,$GUI_UNCHECKED)
			_MemoryWrite($Camera_Transparency, $Proceso,1, 'float')
		$State_Transparency = 0
		Update_List("Transparency disabled")
		EndIf
		
		EndFunc
	
;===============================================================================
;Funciones
;===============================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;La funcion setbitmap cambia las propiedades de opacidad del GUI, en toda la aplicacion se usa mediante un bucle FOR, que es incrementado hasta 255.
;La linea que se encarga de cambiar la opacidad es DllStructSetData($tBlend, "Alpha", $iOpacity)
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Func SetBitmap($hGUI, $hImage, $iOpacity)
	Sleep(20)
    Local $hScrDC, $hMemDC, $hBitmap, $hOld, $pSize, $tSize, $pSource, $tSource, $pBlend, $tBlend
    Local Const $AC_SRC_ALPHA = 1
    $hScrDC = _WinAPI_GetDC(0)
    $hMemDC = _WinAPI_CreateCompatibleDC($hScrDC)
    $hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
    $hOld = _WinAPI_SelectObject($hMemDC, $hBitmap)
    $tSize = DllStructCreate($tagSIZE)
    $pSize = DllStructGetPtr($tSize)
    DllStructSetData($tSize, "X", _GDIPlus_ImageGetWidth($hImage))
    DllStructSetData($tSize, "Y", _GDIPlus_ImageGetHeight($hImage))
    $tSource = DllStructCreate($tagPOINT)
    $pSource = DllStructGetPtr($tSource)
    $tBlend = DllStructCreate($tagBLENDFUNCTION)
    $pBlend = DllStructGetPtr($tBlend)
    DllStructSetData($tBlend, "Alpha", $iOpacity)
    DllStructSetData($tBlend, "Format", $AC_SRC_ALPHA)
    _WinAPI_UpdateLayeredWindow($hGUI, $hScrDC, 0, $pSize, $hMemDC, $pSource, 0, $pBlend, $ULW_ALPHA)
    _WinAPI_ReleaseDC(0, $hScrDC)
    _WinAPI_SelectObject($hMemDC, $hOld)
    _WinAPI_DeleteObject($hBitmap)
    _WinAPI_DeleteDC($hMemDC)
EndFunc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;Esta funcion permite mover el GUI por la pantalla
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func WM_NCHITTEST($hWnd, $iMsg, $iwParam, $ilParam)
    If ($hWnd = $GUI) And ($iMsg = $WM_NCHITTEST) Then Return $HTCAPTION
	EndFunc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;Esta funcion permite mover el GUI por la pantalla
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func _IsPressedKey($hexKey)
; $hexKey must be the value of one of the keys.
; _IsPressed will return 0 if the key is not pressed, 1 if it is.
; $hexKey should entered as a string, don't forget the quotes!
; (yeah, layer. This is for you)
  
  Local $aR, $bO
  
  $hexKey = '0x' & $hexKey
  $aR = DllCall("user32", "int", "GetAsyncKeyState", "int", $hexKey)
  If Not @error And BitAND($aR[0], 0x8000) = 0x8000 Then
     $bO = 1
  Else
     $bO = 0
  EndIf
  
  Return $bO
EndFunc
