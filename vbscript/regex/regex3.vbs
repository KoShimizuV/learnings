Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx


assert(is_match2("^[a]+$", "aaa"))
assert(is_match2("^[b]+$", "1aaa,"))

' Wscript.Echo isEmpty(my_match("aaa,1.ABC,ccc"))

Function assert(bl)
     if bl then
        Wscript.Echo "."
     else
        Wscript.Echo "NG"
     end if
End Function


Function is_match2(ByVal reg_ptn, ByVal v)
    Dim objRegExp, matches
    Set objRegExp = New RegExp
    objRegExp.Pattern = reg_ptn
    Set matches = objRegExp.Execute(v)
    if matches.count = 0 then
        is_match2 = false
    else
        is_match2 = true
    end if
    Set objRegExp = Nothing
end Function 
