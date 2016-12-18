Option Explicit

Dim arr , v
arr = import("a.txt")

for each v in arr
    msgbox v
next

Public Function Import(ByVal strFileName)
    Dim read_all, arr
    Const ForReading = 1
    Dim objFso, objFile
    Set objFso = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFso.OpenTextFile(strFileName, ForReading, False)
    read_all = objFile.ReadAll()
    objFile.Close()
    arr = split(read_all, vblf)
    Import = arr
End Function


