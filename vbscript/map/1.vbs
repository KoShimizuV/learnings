call test()

Sub test()
 
    Set m = CreateObject("Scripting.Dictionary")
    Call m.Add("code1", "value1")
    Call m.Add("code2", "value2")
     
    For Each k In m
        WScript.Echo "key=" & k
        WScript.Echo "val=" & m.Item(k)
    Next
     
End Sub