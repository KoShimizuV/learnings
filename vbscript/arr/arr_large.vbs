Option Explicit

Dim arr(), n, i
n = 1000000
Redim arr(n)

For i=0 to n
    arr(i) = i
    log(arr(i))
Next

WScript.Echo ("end")

Sub log(line)
    Dim fso, w
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")
    Set w = fso.OpenTextFile("log.txt", 8, True)
    w.WriteLine(line)
    w.close()
End Sub
