Option Explicit

import "a.txt"

Public Sub Import(ByVal strFileName)
    Const ForReading = 1
    Dim objFso, objFile
    Set objFso = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFso.OpenTextFile(strFileName, ForReading, False)
    ExecuteGlobal objFile.ReadAll()
    objFile.Close()
End Sub


