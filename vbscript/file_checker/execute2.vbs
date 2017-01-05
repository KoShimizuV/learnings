Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx

call execute("execute2.csv" , "execute2_error.csv", "settings.txt")

sub execute(csv_path, output_path, settings_path)
   Dim csv_arr, csv_mask_settings, error_list
   csv_arr = load_csv_as_arr(csv_path)
   Set csv_mask_settings = load_csv_check_ini(settings_path)
   error_list = chk_arr_data(csv_arr, csv_mask_settings)
   call error_debug (output_path, error_list)
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

function load_csv_check_ini(settings_path)
    set load_csv_check_ini = load_as_map(settings_path)
end function

function load_as_map(file_path) 
    Dim objFSO ,objFile ,m ,line, arr
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(file_path)
    
    Set m = CreateObject("Scripting.Dictionary")

    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
    
    Do While objFile.AtEndOfStream <> True
        line = objFile.ReadLine
        arr = split(line, ",")
        call m.add(CInt(arr(0)), CStr(arr(1)))
    Loop
    objFile.Close
    
    Set objFile = Nothing
    Set objFSO = Nothing
    set load_as_map = m
end function 

function load_csv_check_ini_stub(settings_path)
    Dim m
    Set m = CreateObject("Scripting.Dictionary")
    Call m.Add(0, "1")
    Call m.Add(1, "2")
    Call m.Add(2, "3")
    Call m.Add(3, "a@example.com")
    Call m.Add(4, "1")
    Set load_csv_check_ini_stub = m
end function

' this method can't use last column
function check(v, ptn)
    if v = "" then
        check = true
        exit function
    end if
    if ptn = "1" then
        check = is_number(v)
    elseif ptn = "2" then
        check = check_char(v)
    elseif ptn = "3" then
        check = check_char_kana(v)
    else
        check = ptn
    end if 
end function

function is_number(v)
    Dim reg_obj
    Set reg_obj = New RegExp
    reg_obj.Pattern = "^[0-9]+$"
    reg_obj.Global = True
    if reg_obj.Test(v) = TRUE then
        is_number = TRUE
    else
        is_number = "is not number"
    end if
    Set reg_obj = Nothing
end function

function check_char(v)
    check_char = left(v,1) & String(len(v)-1, "��")
end function

function check_char_kana(v)
    check_char_kana = left(v,1) & String(len(v)-1, "�")
end function

function chk_arr_data(csv_arr, csv_mask_settings)
    Dim line, v, arr, i, j, ptn,  error_arr(), v_trm, ret, col_n, header_arr
    Redim Preserve error_arr(Ubound(csv_arr) * 4)
    i = 0
    j = 0
    for each line in csv_arr
        arr = split(line, ",")
        if i = 0 then
            header_arr = arr
            error_arr(j) = "error_msg,column_name,value," & line
            j = j + 1
        elseif line <> "" then
            for each col_n in csv_mask_settings 
                ptn = csv_mask_settings.Item(col_n)
                v = arr(col_n)
                v_trm = replace(v, """", "")
                ret = check(v_trm, ptn) 
                if ret <> TRUE then
                    error_arr(j) = ret &","& header_arr(col_n) & "," & v &","& line
                    j = j + 1
                end if
            next
        end if
        i = i + 1
    next
    Redim Preserve error_arr(j)
    chk_arr_data = error_arr
end function

sub error_debug(output_path, err_list)
    Dim objFSO, objFile, line
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(output_path, 2, TRUE)
    
    If Err.Number <> 0 Then
        WScript.Echo "Error" & Err.Description
    End If
   
    for each line in err_list 
        objFile.Write line
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
'   is_hirax_kata_kanji_1st2nd  = is_match2("^[��-��@-����-�]*$", v)
'end function

'function is_multi_byte(ByVal v)
'   is_multi_byte  = is_match2("^[^ -~�-�]*$", v)
'end function

