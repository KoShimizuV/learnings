<html>
<head>
<script type="text/javascript" src="index_script.js"></script>
<title></title>
</head><body>
<pre>
<?php
    var_dump($_POST);
?>  
</pre>
<form name="test_form" method="post">
    <input type="text" name="category_input" value="{$qa.category}" id="category_input"/>
    <select name="category_select" id="category_select" style="display:none">
        <option value="" />-- 選択してください --
        {foreach from=$category_list item=cate_arr}
            <option value="{$cate_arr.category}" {if $cate_arr.category == $qa.category} selected = "selected" {/if}/>{$cate_arr.category}
        {/foreach}
	</select>
	<input type="radio" id="mode" name="mode" value="input" onclick="switchDisplay('category_input', 'category_select')" checked/>入力
	<input type="radio" id="mode" name="mode" value="select" onclick="switchDisplay('category_input', 'category_select')"  />選択
    <input type="hidden" name="category" value="{$qa.category}" />
    <input type="submit"/>
</form>
</body>
</html>