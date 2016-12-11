Option Explicit

' test method
Dim o 
Set o = new TestArrayList
call o.execute()

Class ArrayList
    
    Private arr()
    Private i     ' keep next blank index
    Private unit

    Private Sub Class_Initialize()
        unit = 10
        i = 0
        Redim Preserve arr(i)
    End Sub

    Sub add(v)
        Dim maxN,u
        maxN = Ubound(arr)
        if (i >= maxN) then
            Redim Preserve arr(maxN + unit)
        end if
        arr(i) = v
        i = i + 1
    End Sub

    Function item(index)
        item = arr(index)
    End Function
End Class

Class TestArrayList
   sub execute()
       Dim obj, a
       Set obj = new ArrayList
       obj.add("aaa")
       a = obj.item(0)
       WScript.Echo a = "aaa"
   end sub


End Class
