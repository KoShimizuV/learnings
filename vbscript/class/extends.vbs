Option Explicit

Dim c
Set c = new Sample2
call c.hello()

Class Sample2 Extends Sample1
    Function foo()
        Wscript.Echo "foo"
    End Function
End Class

Class Sample1
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
