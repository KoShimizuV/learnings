

call execute("tmp.csv", "settings.ini")

sub execute(file_path, setting_path)


end sub



function is_number(v)
  if isNumeric(v) & len(v) = lenb(v) then
    is_number = TRUE
  else
    is_number = FALSE
  end if
end function



function read_by_line(file_path) 
    Dim objFSO, objFile, arr
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(file_path)
    arr = new Array()

    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
    
    Do While objFile.AtEndOfStream <> True
        WScript.Echo objFile.ReadLine
    Loop
    objFile.Close
    
    Set objFile = Nothing
    Set objFSO = Nothing
end function



Sub log(line)
    Dim fso, w
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")
    Set w = fso.OpenTextFile("log.txt", 8, True)
    w.WriteLine(line)
    w.close()
End Sub
