<html>
<body>
<?php
var_dump($_REQUEST);

?>
<form name="text" action="./test.php">
<input type="text" name="in" value="test">
<a href="javascript:;" onclick="this.form.submit();">submit</a>
</form>

</body>
</html>