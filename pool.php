<?php

do {
	$c = @file_get_contents('http://pubbay.com/lockup/?admin');
	if ($c == 'lock') `/Users/soheil/lock`;
	if ($c == 'unlock') `sh key`;
	sleep(1);
} while (1);
