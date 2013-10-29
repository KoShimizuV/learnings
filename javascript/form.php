<html/>
<script type="text/javascript">
<!--
function func(target) {
 	document.fm.c.value = "pc";
 	document.fm.p.value = "qa";
 	document.fm.a.value = target;
	document.fm.submit();
}
// -->
</script>
<pre>
<?php
    var_dump($_REQUEST);
?>
</pre>
<form name="fm" action="./form.php" method="post" >
    <select name="category" id="category">
        <option value="1" />-- 選択してください --
    </select>
    <input type="hidden" name="c" value="carrer">
    <input type="hidden" name="a" value="action">
    <input type="hidden" name="p" value="packpage">
    <input type="button" name="search" onclick="func('search');" value="search">
    <input type="button" name="test" onclick="func('test');" value="test">
</form>
</html>