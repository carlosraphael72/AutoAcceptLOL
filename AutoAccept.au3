#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ImageSearch2015.au3>

HotKeySet("{ESC}", "parar")

$iconeAceitar = "img/aceitar.png"
Global $procurar = True

#Region ### START Koda GUI section ###
$AutoAcceptGUI = GUICreate("Auto Accept LOL", 332, 233, -1, -1)
GUISetBkColor(0x000000)
$btnProcurar = GUICtrlCreateButton("Procurar Partida", 112, 112, 107, 49)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x008000)
$texto = GUICtrlCreateLabel("Pressione ESC para parar o bot", 36, 64, 258, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnProcurar
			aceitar()
	EndSwitch
WEnd



Func aceitar()
	$x = 0
	$y = 0
	$repetir = True

	While $repetir = True
		If $procurar = True Then
			WinActivate("League of Legends")
			GUICtrlSetState($btnProcurar, $GUI_DISABLE)
			While $procurar = True

				Sleep(1000)
				ToolTip("Aguardando a partida", 0, 0)

				$aceitar = _ImageSearch($iconeAceitar, 1, $x, $y, 20, 0)
				If $aceitar = 1 Then
					MouseClick("LEFT", $x, $y, 1, 15)
					Sleep(2000)
					aceitar()
				EndIf

			WEnd
		Else
			MsgBox(0, "Aviso", "Bot parado")
			GUICtrlSetState($btnProcurar, $GUI_ENABLE)
			ToolTip("")
			$repetir = False
		EndIf
	WEnd
	$procurar = True
EndFunc

Func parar()
	$procurar = False

EndFunc