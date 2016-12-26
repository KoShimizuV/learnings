Option Explicit

call execute

sub execute()
    Dim map, k
    Set map = load_as_map("LoadAsMap.txt")
    for each k in map 
         WScript.Echo "key=" & k & ", val=" & map.Item(k)
    next
end sub

function load_as_map(file_path) 
    Dim objFSO ,objFile ,m ,line, arr
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(file_path)
    
    Set m = CreateObject("Scripting.Dictionary")

    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
    
    Do While objFile.AtEndOfStream <> True
        line = objFile.ReadLine
        arr = split(line, ",")
        call m.add(arr(0), arr(1))
    Loop
    objFile.Close
    
    Set objFile = Nothing
    Set objFSO = Nothing
    set load_as_map = m
end function 

