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

        Redim Preserve arr(3)
        arr(3) = "d"

        Dim v 
        For Each v in arr
            WScript.Echo(v)
        Next

        WScript.Echo ("done")
    End Function
End Class
