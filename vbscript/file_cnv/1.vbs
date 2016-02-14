Option Explicit

Dim f,r,w,in_path,out_path

in_path = "in.txt"
out_path = "out.txt"

Set f = WScript.CreateObject("Scripting.FileSystemObject")
set r = f.OpenTextFile(in_path)
set w = f.OpenTextFile(out_path, 2, True)

Do While r.AtEndOfStream <> True
    w.write(r.readLine & vblf)
Loop
r.close
w.close

WScript.Echo "Done"
