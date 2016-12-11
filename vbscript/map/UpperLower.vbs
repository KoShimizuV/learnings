call test()

Sub test()
 
    Set m = CreateObject("Scripting.Dictionary")
    Call m.Add("a", "value1")
    Call m.Add("A", "value2")
     
    For Each k In m
        WScript.Echo "key=" & k
        WScript.Echo "val=" & m.Item(k)
    Next
     
End Sub
