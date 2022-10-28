<?php
require_once 'database.php';

$result = '';
if (isset($_GET['token'])) {
    $token = $_GET['token'];
    $id_tovar = $_GET['id_tovara'];
    $count = $_GET['count'];
    $sql = sprintf('SELECT `ID` FROM `users` WHERE `TOKEN` LIKE \'%s\' AND `EXPIRED` > CURRENT_TIMESTAMP', $token);
    $stmt = $db->query($sql)->fetch();
    if (isset($stmt['ID'])) {
        $id_user = $stmt['ID'];

        $sql = sprintf('INSERT INTO `korzina` (`ID_TOVARY`,`ID_USER`,`COUNT`) VALUES (%d,%d,%d);', $id_tovar,$id_user,$count);
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
