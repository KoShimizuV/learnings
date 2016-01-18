Option Explicit
' On Error Resume Next

call write_file("a.txt", "line aaa 1", 2)
call write_file("a.txt", "line aaa 2", 8)

' open_type : 1=read_only, 2=write_only, 8=append
sub write_file(ByVal file_path, ByVal line, ByVal open_type) 
    Dim objFSO, objFile
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(file_path, open_type, TRUE)
    
    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
   
    objFile.WriteLine line
    If Err.Number <> 0 Then
        WScript.Echo "Error in writing" & Err.Description
    End If
   
    objFile.Close
    
    Set objFile = Nothing
    Set objFSO = Nothing
end sub
