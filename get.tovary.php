<?php
require_once 'database.php';

$result = '{"response":[';
$stmt = $db->query("SELECT t.`ID`,`TITLE`,`DESCRIPTION`,`PRICE`,`COUNT`,`NAME` FROM `tovary` AS t JOIN `kateg` AS k ON t.ID_CAT=k.ID");
while($row = $stmt->fetch())
{
    $result .= '{';
    $result .= '"id":'.$row['ID'].',"title":"'.$row['TITLE'].'","desc":"'.$row['DESCRIPTION'].'","price":'.$row['PRICE'].',"name":"'.$row['NAME'].'"';
    $result .= '},';
}
$result = rtrim($result,",");
$result .= ']}';
echo $result;
?>
