Option Explicit
' On Error Resume Next

call read_by_line("a.txt")

sub read_by_line(file_path) 
    Dim objFSO, objFile
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(file_path)
    
    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
    
    Do While objFile.AtEndOfStream <> True
        WScript.Echo objFile.ReadLine
    Loop
    objFile.Close
    
    Set objFile = Nothing
    Set objFSO = Nothing
end sub
