Option Explicit

Dim c
Set c = new Sample
call c.execute()

Class Sample
    Private arr

    Private Sub Class_Initialize()
    End Sub

    Function execute()
        arr = split("a,b,c", ",")
        WScript.Echo ("done")
    End Function
End Class
