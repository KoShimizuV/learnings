Option Explicit

Dim line, arr, line2

line = "1,v,aa"
arr = Split(line, ",")

arr(0) = "4"
line2 = join(arr, ",")
WScript.Echo line2
