Option Explicit

Dim objRegExp       
Dim strRepBefore    
Dim strRepAfter     
Set objRegExp = New RegExp
objRegExp.Pattern = "[A-Za-z0-9]*@[A-Za-z0-9.]*"
strRepBefore = "E-Mail: tipstest@whitire.com !!"
strRepAfter = objRegExp.Replace(strRepBefore, "*****")
WScript.Echo "bfr : " & strRepBefore &vbcr& "aft : " & strRepAfter

Set objRegExp = Nothing
