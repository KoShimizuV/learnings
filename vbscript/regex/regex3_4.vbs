Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx

assert(is_multi_byte("1aaa,"))
assert(is_multi_byte("1あ"))
assert(is_multi_byte("ｶﾅ"))
assert(is_multi_byte("ｶﾅあ"))
assert(is_multi_byte("あ い"))
assert(is_multi_byte("あ"))


function is_multi_byte(ByVal v)
   is_multi_byte  = is_match2("^[^ -~｡-ﾟ]*$", v)
end function

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
    is_match2 = objRegExp.Test(v)
    Set objRegExp = Nothing
end Function 
