<?php
require_once 'database.php';

$result='';

if(!empty($_POST['login'])&&!empty($_POST['password'])){
	$login = $_POST['login'];
	$password = $_POST['password'];

	$token = md5(time());
	$expiration = time() + 48*60*60;

	$sql = sprintf('INSERT INTO `users` (`ID`, `LOGIN`, `PASSW`, `TOKEN`, `EXPIRED`) VALUES (NULL, \'%s\', \'%s\', \'%s\',FROM_UNIXTIME(%d))',$login,$password,$token,$expiration);
	$sql2 = sprintf('SELECT `LOGIN` FROM `users` WHERE `LOGIN` LIKE \'%s\'',$login);
	$result = '{"user":';
	$stmt=$db->query($sql2)->fetch();
    
	if($stmt) {
		$result = '{"error":{"text":"пользователь с таким логином уже существует"}}';
	}
	else{
		$db->query($sql);
        $stmt = $db->query('SELECT LAST_INSERT_ID() AS ID')->fetch();
		if(isset($stmt['ID'])){	
			
			$result .= sprintf('{"id":%d,"text":"OK"}',$stmt['ID']);
			$result .='}';
	}
}	
}else{
	$result='{"error":{"text":"не передан логин/пароль"}}';
}
echo $result;
?>
