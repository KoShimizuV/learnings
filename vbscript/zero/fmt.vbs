Option Explicit

Dim u
Set u = new Util
call u.test_suite

Class Util

    Public Function zero_fmt(ByVal str, ByVal length)
       Dim i, n, v
       n = length - len(str)
       for i = 1 to n 
            v = "0" & v
       Next
       zero_fmt = v & str
    End Function


    Public Sub test_suite
        call test1()
    End Sub

    Private Sub test1()
       if "00abc" <> zero_fmt("abc", 5) then WScript.Echo "NG test1.1" end if
       if "000abc" <> zero_fmt("abc", 6) then WScript.Echo "NG test1.2" end if
       if "000000" <> zero_fmt("", 6) then WScript.Echo "NG test1.3" end if
       if "000001" <> zero_fmt("001", 6) then WScript.Echo "NG test1.4" end if
    End Sub

    
End Class
