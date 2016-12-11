Option Explicit

Dim c
Set c = new Sample("John")
call c.hello()

Class Sample
    Public name
    Private sep

    Private Sub Class_Initialize(n)
        name = n
        sep = ":"
    End Sub

    Function hello()
        WScript.Echo "Hi " & sep & name
    End Function
End Class
