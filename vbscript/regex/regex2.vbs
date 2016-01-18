Option Explicit


call my_rep("aaa,1.ABC,ccc")
call my_rep("aaa,1.xyz,ccc")
call my_rep("aaa,1.00,ccc")
call my_rep("aaa,2.ABC,ccc")
call my_rep("aaa,3.ABC,ccc")
call my_rep("aaa,4.ABC,ccc")

Sub my_rep(ByVal strRepBefore)
    Dim objRegExp, strRepAfter 
    Set objRegExp = New RegExp
    objRegExp.Pattern = "(,[1-4]).[A-Za-z0-9]+,"
    strRepAfter = objRegExp.Replace(strRepBefore, "$1,")
    WScript.Echo "bfr : " & strRepBefore &vbcr& "aft : " & strRepAfter
    Set objRegExp = Nothing
end Sub
