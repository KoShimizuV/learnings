Option Explicit
Dim wsh,strCmd

Set wsh = WScript.CreateObject("WScript.Shell")
strCmd = "cmd /c powershell echo abc > a.txt"
wsh.Run strCmd,0,True
