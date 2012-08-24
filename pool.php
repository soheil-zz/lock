<?php

if (!file_exists('code')) {
	`get_code`;
	exit;
}

do {
	$code = @file_get_contents('code');
	$c = @file_get_contents('http://pubbay.com/lockup/?admin&uuid=' . $code);
	if ($c == 'lock') `/Users/soheil/lock`;
	if ($c == 'unlock') `sh key`;
	sleep(3);
} while (1);
