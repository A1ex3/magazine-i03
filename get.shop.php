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
        $result = '{"pokupki":[';
        $sql = sprintf('SELECT t.`ID`, `TITLE`, t.`DESCRIPTION`, t.`PRICE`, k.`COUNT`, kat.`NAME` FROM `korzina` AS k JOIN `tovary` AS t ON k.`ID_TOVAR` = t.`ID` JOIN `category` AS kat ON t.`ID_CAT` = kat.`ID` WHERE `ID_USER` = %d', $id_user);
        $stmt = $db->query($sql);
        while ($row = $stmt->fetch()) {
            $result .= '{';
            $result .= '"id":'.$row['ID'].',"title":"'.$row['TITLE'].'","desc":"'.$row['DESCRIPTION'].'","prise":'.$row['PRISE'].',"count":'.$row['COUNT'].',"kat":"'.$row['NAME'].'"';
            $result .= '],';
        }
        $result = rtrim($result, ",");
        $result .= ']}';
    }
    else {
        $result = '{"error": {"text": "Неверный или просроченный токен"}}';
    }
}
else {
    $result = '{"error": {"text": "Не передан токен"}}';
}
echo $result;
