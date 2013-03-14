;================================
;Google Code's download
;================================
InetGet("http://php-wow.googlecode.com/svn/trunk/WaR/BugCraftsOffsets.ini",@TempDir&"\BugCraftsOffsets.ini")
$Camera_POINTER = IniRead(@TempDir&"\BugCraftsOffsets.ini", "PointerList", "Camera_POINTER", "")

;Camera
$Camera_Offset = _MemoryRead($Camera_POINTER, $Proceso, 'ptr'); MIN 12 MAX 500
$Camera_Offset_Level1 = 0x1fc

$Camera_Z = $Camera_Offset + $Camera_Offset_Level1 -4

$Camera_R = $Camera_Offset + $Camera_Offset_Level1 - 0x8
$Camera_Transparency = $Camera_Z + 0x78
ClipPut($Camera_Transparency);
$Camera_Altitude = $Camera_Z - 0x4
$Camera_FieldOfview = $Camera_Z + 0x198
$Camera_HorizontalView = $Camera_FieldOfview + 0x8
;NINJA MODE
$Ninja_POINTER = IniRead(@TempDir&"\BugCraftsOffsets.ini", "PointerList", "NinjaPointer", "")

$Ninja_Offset = _MemoryRead($Ninja_POINTER, $Proceso, 'ptr')
$Ninja_Offset_Level1 = 0x5C

$Ninja_Mode = $Ninja_Offset + $Ninja_Offset_Level1

;Player
$Player_POINTER = IniRead(@TempDir&"\BugCraftsOffsets.ini", "PointerList", "PlayerPointer", "")

$Player = $Player_POINTER
$Player_X = $Player
$Player_Y = $Player + 0x4
$Player_Z = $Player + 0x8

$PlayerAccount_POINTER = IniRead(@TempDir&"\BugCraftsOffsets.ini", "PointerList", "PlayerAccount", "")

$Player_Account = $PlayerAccount_POINTER
$Player_Name = $Player_Account + 0xC8

;Player data
$HacksPointer_POINTER = IniRead(@TempDir&"\BugCraftsOffsets.ini", "PointerList", "HacksPointer", "")

$Player_Hacks = $HacksPointer_POINTER
$Player_Hacks = _MemoryRead($Player_Hacks, $Proceso, 'ptr')

$Player_Health =  "0x" & Hex($Player_Hacks + 0x188) ;Read only
$Player_Health_Actual = "0x" & Hex($Player_Hacks + 0x18C) 

$Player_Energy =  "0x" & Hex($Player_Hacks + 0x198) ;Read only
$Player_Energy_Actual = "0x" & Hex($Player_Hacks + 0x19C) 

$Player_Speed_Hack =  "0x" & Hex($Player_Hacks + 0x9C) ;write
$Player_Type_Alliance =  "0x" & Hex($Player_Hacks + 178) ;write 0xB2

$Player_Fly = "0x" & Hex($Player_Hacks + 0x60) ; 4bytes 1536 = ACTIVATE
$Player_Fly1 = "0x" & Hex($Player_Hacks + 0x184) ; 4bytes 2 = activate

$Player_Fly2 = "0x" & Hex($Player_Hacks + 0xA0) ; float 6 = activate
$Player_Fly3 = "0x" & Hex($Player_Hacks + 0xA0 + 4) ; float 6 = activate
$Player_FlyUP = "0x" & Hex($Player_Hacks + 0x94) ;write

$Player_SuperJump = "0x" & Hex($Player_Hacks + 0xaC) ;write

;TO Do
$CTM_Move_Start = $Player_Hacks + 0xa8 ; 1
$CTM_Action = $Player_Hacks + 0x64; 2 = normal 4 = click to move
;TO Do

;Player Scale/Position offsets MULTI LEVEL POINTER
$Player_CONFG_POINTER = IniRead(@TempDir&"\BugCraftsOffsets.ini", "PointerList", "PlayerConfiguration", "")

$Player_CONFG = $Player_CONFG_POINTER
$Player_CONFG = _MemoryRead($Player_CONFG, $Proceso, 'ptr')
$Player_CONFG = $Player_CONFG + 0x8
$Player_CONFG = _MemoryRead($Player_CONFG, $Proceso, 'ptr')
$Player_CONFG = $Player_CONFG + 0x14C


$Player_CONFG_Scale = $Player_CONFG 
$Player_CONFG_X_Position = $Player_CONFG + 0x4
$Player_CONFG_Y_Position = $Player_CONFG + 0xC
$Player_CONFG_Z_Position = $Player_CONFG + 0x8
