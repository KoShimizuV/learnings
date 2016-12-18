Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx


call execute("regex_csv_1.csv" , "b.ini")

sub execute(csv_path, settings_path)
   Dim csv_arr, csv_check_settings, error_list
   csv_arr = load_csv_as_arr(csv_path)
   Set csv_check_settings = load_csv_check_ini(settings_path)
   error_list = check_file_fmt(csv_arr, csv_check_settings)
   call error_debug (error_list)
end sub


function load_csv_as_arr(csv_path)
    Dim read_all, arr
    Const ForReading = 1
    Dim objFso, objFile
    Set objFso = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFso.OpenTextFile(csv_path, ForReading, False)
    read_all = objFile.ReadAll()
    objFile.Close()
    arr = split(read_all, vblf)
    load_csv_as_arr = arr
end function


function load_csv_as_arr_tmp(csv_path)
    Dim arr
    arr = Array("T6E001,‚ ‚¢‚¤,a11,‘SŠp", "T6E002,‚ ‚¢‚¤,a11,‘S Šp")
    Redim Preserve arr(2)
    load_csv_as_arr = arr
end function

function load_csv_check_ini(settings_path)
    Dim m
    Set m = CreateObject("Scripting.Dictionary")
    Call m.Add(0, "^[T]{1}[0-9]{1}[A-Z]{1}[0-9]+$")
    Call m.Add(1, "^[^ -~¡-ß]*$")
    Call m.Add(2, "^[^ -~¡-ß]*$")
    Call m.Add(3, "^[^ -~¡-ß]*$")
    Set load_csv_check_ini = m
end function


function check_file_fmt(csv_arr, csv_check_settings)
    Dim line, v, arr, i, err_idx, ptn, err()
    Redim Preserve err(100)
    err_idx = 0
    for each line in csv_arr
        arr = split(line, ",")
        i = 0
        for each v in arr
            ptn = csv_check_settings.Item(i)
            if is_match2(ptn, v) = FALSE then
                err(err_idx) = (v & "," & line)
                err_idx = err_idx + 1
            end if
            i = i + 1
        next
    next
    Redim Preserve err(err_idx - 1)
    check_file_fmt = err
end function

sub error_debug(err_list)
    Dim objFSO, objFile, line
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile("regex_csv_1_error.csv", 2, TRUE)
    
    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
   
    for each line in err_list 
        objFile.WriteLine line
        If Err.Number <> 0 Then
            WScript.Echo "Error in writing" & Err.Description
        End If
    Next
    objFile.Close
    
    Set objFile = Nothing
    Set objFSO = Nothing
end sub

sub error_debug_tmp(err_list)
    Dim v
    for each v in err_list
		msgbox(v)
    next
end sub


Function is_match2(ByVal reg_ptn, ByVal v)
    Dim objRegExp, matches
    Set objRegExp = New RegExp
    objRegExp.Pattern = reg_ptn
    is_match2 = objRegExp.Test(v)
    Set objRegExp = Nothing
end Function 


'function is_hira_kata_kanji_1st2nd(ByVal v)
'   is_hirax_kata_kanji_1st2nd  = is_match2("^[‚Ÿ-‚ñƒ@-ƒ–ˆŸ-ê¤]*$", v)
'end function

'function is_multi_byte(ByVal v)
'   is_multi_byte  = is_match2("^[^ -~¡-ß]*$", v)
'end function

