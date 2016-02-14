Option Explicit

Dim arr, v
arr = Array(new User, new User)

For Each v in arr
    WScript.Echo v.name
Next

Class User
    Public name
    Public Sub Class_Initialize()
        name = "foo"
    End Sub
End Class
