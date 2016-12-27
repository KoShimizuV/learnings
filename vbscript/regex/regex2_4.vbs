Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx

Wscript.Echo my_rep("あいう")
Wscript.Echo my_rep("あい う")
Wscript.Echo my_rep("あ いう")
Wscript.Echo my_rep(" あいう")
Wscript.Echo my_rep("あいう ")
Wscript.Echo my_rep("あ")

Function my_rep(ByVal v)
    Dim objRegExp, strRepAfter, Matches, match, tmp_str_prefix, tmp_str_suffix
    Set objRegExp = New RegExp
    objRegExp.Pattern = "[^ ]"
    objRegExp.Global = True
    tmp_str_prefix = left(v, 1) 
    tmp_str_suffix = right(v, len(v)-1)
    my_rep = tmp_str_prefix & objRegExp.Replace(tmp_str_suffix, "*")
    Set objRegExp = Nothing
end Function 
