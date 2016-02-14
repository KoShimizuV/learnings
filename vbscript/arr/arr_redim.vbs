Option Explicit

Dim arr, v
arr = Array(1,2,3)

For Each v in arr
    WScript.Echo v
Next

Redim Preserve arr(10)

arr(3) = 10
WScript.Echo arr(3)
