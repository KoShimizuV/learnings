Option Explicit

Dim u
Set u = new Util
call u.test_suite

Class Util

    Public Function zero_fmt(ByVal str, ByVal length)
        Dim n
        n = length - len(str)
        zero_fmt = String(n, "0") & str
    End Function

    Public Function zero_fmt_rnd(ByVal num, ByVal length)
        ' FIXME
        if num = "" then
           num = 0 
        end if
    
        if num < 100  then
            Randomize
            zero_fmt_rnd = Int(Rnd * 10^length) + 1
        else
            zero_fmt_rnd = zero_fmt(num, length)
        end if
    End Function

    Public Function file_compare(path1, path2)
        Dim f,r1,r2,line1,line2
        Set f = WScript.CreateObject("Scripting.FileSystemObject")
        Set r1 = f.OpenTextFile(path1, 1)
        Set r2 = f.OpenTextFile(path2, 1)
        line1 = r1.ReadAll()
        line2 = r2.ReadAll()
        r1.close
        r2.close
        if line1 = line2 then
            file_compare = true
        else
            file_compare = false
        end if
    End Function

    Private Sub file_put_contents(path, msg)
        Dim f,w
        Set f = WScript.CreateObject("Scripting.FileSystemObject")
        Set w = f.OpenTextFile(path, 2, True)
        w.WriteLine(msg)
        w.close
    End Sub 

   Public Sub test_suite
        call test1()
        call test2_zero_fmt_rnd()
        call test3_file_compare()
    End Sub

    Private Sub test1()
        Dim s1,s2,s3,s4
        s1 = zero_fmt("abc", 5)
        if "00abc" <> s1 then WScript.Echo "NG test1.1" & vbcr & s1 end if
        if "000abc" <> zero_fmt("abc", 6) then WScript.Echo "NG test1.2" end if
        if "000000" <> zero_fmt("", 6) then WScript.Echo "NG test1.3" end if
        if "000001" <> zero_fmt("001", 6) then WScript.Echo "NG test1.4" end if
    End Sub

    Private Sub test2_zero_fmt_rnd()
        Dim s2,s3,s4
       if "0101" <> zero_fmt_rnd("101", 4) then WScript.Echo "NG test2.1" end if
       if "000100" <> zero_fmt_rnd("100", 6) then WScript.Echo "NG test2.1" end if

        s2 = zero_fmt_rnd("99", 6)
        if "000099" = s2 then WScript.Echo "NG test2.2" & vbcr & s2 end if
        s3 = zero_fmt_rnd("5", 6)
        if "00005" = s3 or s2 = s3 then WScript.Echo "NG test2.3" & vbcr & s3 end if
        
        s4 = zero_fmt_rnd("", 6)
        if "000000" = s4 then WScript.Echo "NG test2.4.1" & vbcr & s4 end if
        if 6 <> len(s4) then WScript.Echo "NG test2.4.2" & vbcr & s4 end if
    End Sub

    Private Sub test3_file_compare()
        call file_put_contents("t3-a.txt","aaa")
        call file_put_contents("t3-b.txt","aaa")
        if file_compare("t3-a.txt", "t3-b.txt") then WScript.Echo "Ok" else WScript.Echo "NG" end if
        
        call file_put_contents("t3-c.txt","aab")
        if file_compare("t3-a.txt", "t3-c.txt") = False then WScript.Echo "OK" else WScript.Echo "NG" end if
    End Sub
   
End Class
