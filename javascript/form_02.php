<html/>
<pre>
<?php
    var_dump($_REQUEST);
?>
</pre>
<form name="fm" action="./form_02.php" method="post" >
    <select name="category" id="category">
        <option value="1" />-- 選択してください --
    </select>
    <input type="hidden" name="c" value="carrer">
    <input type="hidden" name="p" value="packpage">
    <input type="submit" name="search" value="search">
    <input type="submit" name="test" value="test">
</form>
</html>