Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc410238.aspx

Dim str_txt
str_txt = Inputbox("please input message")

if str_txt = "" then
    Wscript.Echo "message is not entered or canceled"
    Wscript.Quit
end if

Wscript.Echo "You input this message : " & str_txt
