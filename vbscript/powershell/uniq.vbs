Option Explicit

call wsh_exe("cmd /c powershell echo abc > a.txt")
call wsh_exe("cmd /c powershell echo zzz >> a.txt")
call wsh_exe("cmd /c powershell echo acc >> a.txt")
call wsh_exe("cmd /c powershell echo acc >> a.txt")
call wsh_exe("cmd /c powershell cat a.txt | sort | uniq > s.txt")

sub wsh_exe(str_cmd) 
    Dim wsh
    Set wsh = WScript.CreateObject("WScript.Shell")
    wsh.Run str_cmd,0,True
    wsh.close
end sub
