Option Explicit
' https://msdn.microsoft.com/ja-jp/library/cc392403.aspx

call execute("mask_csv1.csv" , "b.ini")

sub execute(csv_path, settings_path)
   Dim csv_arr, csv_mask_settings, masked_list
   csv_arr = load_csv_as_arr(csv_path)
   Set csv_mask_settings = load_csv_check_ini(settings_path)
   masked_list = cnv_arr_data(csv_arr, csv_mask_settings)
   call error_debug (masked_list)
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
    Dim m
    Set m = CreateObject("Scripting.Dictionary")
    Call m.Add(0, "1")
    Call m.Add(1, "2")
    Call m.Add(2, "3")
    Call m.Add(3, "a@example.com")
    Call m.Add(4, "1")
    Set load_csv_check_ini = m
end function

' this method can't use last column
function cnv(v, ptn)
    if v = "" then
        cnv = v
        exit function
    end if
    if ptn = "1" then
        cnv = cnv_num(v)
    elseif ptn = "2" then
        cnv = cnv_char(v)
    elseif ptn = "3" then
        cnv = cnv_char_kana(v)
    else
        cnv = ptn
    end if 
end function

function cnv_num(v)
    Dim reg_obj
    Set reg_obj = New RegExp
    reg_obj.Pattern = "[0-9]"
    reg_obj.Global = True
    cnv_num = reg_obj.Replace(v, "9")
    Set reg_obj = Nothing
end function

function cnv_char(v)
    cnv_char = left(v,1) & String(len(v)-1, "Å¶")
end function

function cnv_char_kana(v)
    cnv_char_kana = left(v,1) & String(len(v)-1, "±")
end function

function cnv_arr_data(csv_arr, csv_mask_settings)
    Dim line, v, arr, i, j, ptn,  masked_arr()
    Redim Preserve masked_arr(Ubound(csv_arr))
    i = 0
    for each line in csv_arr
        arr = split(line, ",")
        j = 0
        for each v in arr
            if csv_mask_settings.Exists(j) then
                ptn = csv_mask_settings.Item(j)
                v = replace(v, """", "")
                v = """" & cnv(v, ptn) & """"
            end if
            arr(j) = v
            j = j + 1
        next
        masked_arr(i) = join(arr, ",")
        i = i + 1
    next
    cnv_arr_data = masked_arr
end function

sub error_debug(err_list)
    Dim objFSO, objFile, line
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile("masked.csv", 2, TRUE)
    
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
'   is_hirax_kata_kanji_1st2nd  = is_match2("^[Çü-ÇÒÉ@-Éñàü-Í§]*$", v)
'end function

'function is_multi_byte(ByVal v)
'   is_multi_byte  = is_match2("^[^ -~°-ﬂ]*$", v)
'end function

