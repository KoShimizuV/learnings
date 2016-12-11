Option Explicit

Dim c
Set c = new Sample
call c.hello()

Class Sample
    Public name
    Private sep

    Private Sub Class_Initialize()
        name = "John"
        sep = ":"
    End Sub

    Function hello()
        WScript.Echo "Hi " & sep & name
    End Function
End Class
