<?php
$host="74.117.59.73";
$port=10000;
$timeout=30;
$sk=fsockopen($host,$port,$errnum,$errstr,$timeout) ;
if (!is_resource($sk)) {
    exit("connection fail: ".$errnum." ".$errstr) ;
} else {

    echo "Connected";
    }
?>
