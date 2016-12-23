Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx

Wscript.Echo my_rep("A123")
Wscript.Echo my_rep("A123B")
Wscript.Echo my_rep("A123B88C")
'Wscript.Echo my_rep("AB")

Function my_rep(ByVal strRepBefore)
    Dim objRegExp, strRepAfter, Matches, match, tmp_str
    Set objRegExp = New RegExp
    objRegExp.Pattern = "[0-9]"
    objRegExp.Global = True
    tmp_str = objRegExp.Replace(strRepBefore, "9")
'    Set Matches = objRegExp.Execute(strRepBefore)
'    tmp_str = strRepBefore
'    for each match in Matches
'        tmp_str = objRegExp.Replace(tmp_str, String(match.Length, "9"))
'    next
    my_rep = tmp_str 
    Set objRegExp = Nothing
end Function 
