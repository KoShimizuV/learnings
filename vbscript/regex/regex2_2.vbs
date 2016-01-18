Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx

Wscript.Echo my_rep("aaa,1.ABC,ccc")
Wscript.Echo my_rep("aaa,1.xyz,ccc")
Wscript.Echo my_rep("aaa,1.xYz,ccc")
Wscript.Echo my_rep("aaa,1.00,ccc")
Wscript.Echo my_rep("aaa,2.ABC,ccc")
Wscript.Echo my_rep("aaa,3.ABC,ccc")
Wscript.Echo my_rep("aaa,4.ABC,ccc")

Function my_rep(ByVal strRepBefore)
    Dim objRegExp, strRepAfter 
    Set objRegExp = New RegExp
    objRegExp.Pattern = "(,[1-4]).[A-Za-z0-9]+,"
    my_rep = objRegExp.Replace(strRepBefore, "$1,")
    Set objRegExp = Nothing
end Function 
