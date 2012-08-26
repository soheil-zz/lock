#!/bin/bash
while true
do
 if [ ! -f "code" ]
 then
  echo "Please open up the Lock App on your iOS device and enter the code displayed:"
  read code
  echo $code > code
 fi
 resp=$(curl -s "http://pubbay.com/lockapp/?admin&uuid=$code")
 echo $resp
 if [ "$resp" = "lock" ]
 then
  `/Users/soheil/lock`
  `say 'lock'`
 fi
 if [ "$resp" = "unlock" ]
 then
  `sh key`
  `say 'unlock'`
 fi
 sleep 1
done