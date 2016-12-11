Option Explicit

call init()

Dim fs_obj, rh, line, arr
set fs_obj = WScript.CreateObject("Scripting.FileSystemObject")
set rh = fs_obj.OpenTextFile("out.csv", 1, false)
line = rh.readAll()
WScript.Echo line

arr = Split(line, """,""")
WScript.Echo join(arr, """,""")

sub init ()
    Dim fs_obj, wh
    set fs_obj = WScript.CreateObject("Scripting.FileSystemObject")
    set wh = fs_obj.OpenTextFile("out.csv", 2, true)
    wh.writeLine("""a"",""b"",""c""")
end sub


