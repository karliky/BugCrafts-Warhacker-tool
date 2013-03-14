$Patch = @TempDir&"\BugCraftsOffsets.ini"
ConsoleWrite($Patch)
FileDelete($Patch)
$sData = "Camera_POINTER=0x00F78DA8" & @LF & "NinjaPointer=0x00F74864" & @LF & "PlayerPointer=0x00F9CBB0" & @LF & "PlayerAccount=0x0" & @LF & "HacksPointer=0x00F78DA0" & @LF & "PlayerConfiguration=0x00F778A8"
IniWriteSection($Patch,"PointerList",$sData)