<?php
require_once 'database.php';

$result = '';
if (isset($_COOKIE['auth'])) {

    $token = $_COOKIE['auth'];
    $id_tovar = $_GET['id_tovara'];
    $count = $_GET['count'];
    $sql = sprintf('SELECT `ID` FROM `users` WHERE `TOKEN` LIKE \'%s\' AND `EXPIRED` > CURRENT_TIMESTAMP', $token);
    $stmt = $db->query($sql)->fetch();
    if (isset($stmt['ID'])) {
        $id_user = $stmt['ID'];

        $sql = sprintf('INSERT INTO `korzina` (`ID_USER`,`ID_TOVARA`,`COUNT`) VALUES (%d,%d,%d);', $id_user,$id_tovar,$count);
        $db->query($sql);
        $result = '{"response":{"text": "OK"}}';
    }
    else {
        $result = '{"error": {"text": "Неверный токен или просроченный токен"}}';
    }
}
else {
    $result = '{"error": {"text": "Не передан токен"}}';
}
echo $result;
