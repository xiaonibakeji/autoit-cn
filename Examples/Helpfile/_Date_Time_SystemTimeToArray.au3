#include <GUIConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $tTime, $aTime

	; 创建 GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 获取当前系统时间
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	MemoWrite("Month ........: " & $aTime[0])
	MemoWrite("Day ..........: " & $aTime[1])
	MemoWrite("Year .........: " & $aTime[2])
	MemoWrite("Hour .........: " & $aTime[3])
	MemoWrite("Minute .......: " & $aTime[4])
	MemoWrite("Second .......: " & $aTime[5])
	MemoWrite("Milliseconds .: " & $aTime[6])
	MemoWrite("Day of week ..: " & $aTime[7])

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; 写入一行到 memo 控件
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
