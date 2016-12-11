Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx


assert(is_single_byte("��"))
assert(is_single_byte("����"))
assert(is_single_byte("1a�@a,"))
assert(is_single_byte("�ݶ�"))
assert(is_single_byte("1aaa,"))
assert(is_single_byte("1a a,"))


function is_single_byte(ByVal v)
'    is_single_byte = is_match2("^[\x20-\x7E\xA1-\xDF]+$", v)
    is_single_byte = is_match2("[ -~�-�]", v)
end function



Function is_match2(ByVal reg_ptn, ByVal v)
    Dim objRegExp, matches
    Set objRegExp = New RegExp
    objRegExp.Pattern = reg_ptn
    is_match2 = objRegExp.Test(v)
    Set objRegExp = Nothing
end Function 

Function assert(bl)
     if bl then
        Wscript.Echo "."
     else
        Wscript.Echo "NG"
     end if
End Function

