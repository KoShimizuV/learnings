Option Explicit

Dim a
Set a = new Action
call a.execute()

Class Action
    Private log 
    Private input_file

    Private Sub Class_Initialize()
        Set log = new Logger
        call log.init("log.txt")
        input_file = "input.csv"
    End Sub

    Public Sub execute()
        log.info("init execute")
        Dim list, o
        call create_input_file(input_file)
        list = load_data(input_file)
        For Each o in list
            log.debug(o.to_string())
        Next
        log.info("done execute")
    End Sub

    Private Sub create_input_file(ByVal path)
        Dim f,w,i
        Set f = WScript.CreateObject("Scripting.FileSystemObject")
        Set w = f.OpenTextFile(path, 2, true)
        For i=1 to 10
            w.WriteLine(i & ",john,"&i&",men")
        Next
        w.close
    End Sub

    Private Function load_data(ByVal path)
        log.info("init load_data")
        Dim f,r,o,i,list(),line
        Set f = WScript.CreateObject("Scripting.FileSystemObject")
        Set r = f.OpenTextFile(path, 1)

        i = 0
        Do While r.AtEndOfStream <> True
            i = i + 1
            line = r.ReadLine
            log.info(i & " " & line)
            Set o = get_user_instance(line)
            call o.convert()
            ReDim Preserve list(i-1)
            log.debug(Ubound(list) & " list n is ")
            set list(i-1) = o
            if i > 1000000 then
                log.error("Error has happend in load_data : over 100000 loop")
                WScript.Quit
            end if
        Loop
        r.close()
        load_data = list
        log.info("done load_data")
    End Function

    ' this method should be deffined as static method in User class.
    ' But vbscript can't have static method. 
    Private Function get_user_instance(csv_line)
        Dim o
        set o = new UserA
        o.set_object(csv_line)
        set get_user_instance = o
    End Function
End Class

Class Logger
    Private path
    Public Sub init(ByVal log_path)
       path = log_path 
    End Sub

    Public Sub debug(str)
       log("[debug]" & str) 
    End Sub

    Public Sub info(str)
       log("[info]" & str) 
    End Sub

    Public Sub warn(str)
       log("[warn]" & str) 
    End Sub

    Public Sub error(str)
       log("[info]" & str) 
    End Sub

    Private Sub log(ByVal line)
        Dim f,w
        Set f = WScript.CreateObject("Scripting.FileSystemObject")
        Set w = f.OpenTextFile(path,8,TRUE)
        w.WriteLine("["& now &"]" & line)
        w.close
    End Sub

End Class

Class User
    Private no
    Private name
    Private age 
    Private arr_raw

    Public Sub set_object(ByVal csv)
        arr_raw = split(csv, ",")
        no = arr_raw(0)
        name = arr_raw(1)
        age = arr_raw(2)
    End Sub

    Public Sub convert()
        age = age + 50
    End sub

    Public Function to_string()
        to_string = "no=" & no &",name="& name &",age="& age & "|raw=" & join(arr_raw,",")
    End Function

    Public Sub debug()
        WScript.Echo(to_string())
    End Sub
End Class

' We recommend use this class if input files have so many columns and
' it's flexibility format especially column count.
' e.g. if you wold like to change the only one column in long line csv, this class is useful for you
Class UserA
    Private idx_age
    Private arr_raw
    Private arr

    Public Sub set_object(ByVal csv)
        arr_raw = split(csv, ",")
        arr = arr_raw
        idx_age = 2
    End Sub

    Private Function get_age()
        get_age = arr(idx_age)
    End Function

    Private Sub set_age(ByVal v)
        arr(idx_age) = v
    End Sub

    Public Sub convert()
        set_age(get_age() + 50)
    End sub

    Public Function to_string()
        to_string = "values=" & join(arr,",") & "|raw=" & join(arr_raw,",")
    End Function

    Public Sub debug()
        WScript.Echo(to_string())
    End Sub
End Class
