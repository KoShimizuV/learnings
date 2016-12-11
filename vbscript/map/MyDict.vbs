call test()

Sub test()
 
    
End Sub


Class Map()
    Dim m 
    Public Sub Class_Initialize()
        Set m = CreateObject("Scripting.Dictionary")
    End Sub 
   
    Public Function add(key, val)
        Call m.Add(key,val) 
    End Function
     
End Class
