#!/bin/bash
kill `ps aux | grep pool.sh | awk '{print $2}' | grep -v $$`
clear
while true
do
 if [ ! -f ~/.lock-app-code ]
 then
  echo "Please open up the Lock App on your iOS device and enter the code displayed:"
  read code
  echo $code > ~/.lock-app-code
  echo "Please enter your Mac password to unlock your account:"
  read pass
  echo $pass | base64 > ~/.lock-app-pass
 fi
 resp=$(curl -s "http://pubbay.com/lockapp/?admin&uuid=$code")
 echo $resp
 if [ "$resp" = "lock" ]
 then
  open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app
 fi
 if [ "$resp" = "unlock" ]
 then
  osascript -e 'tell application "System Events" to keystroke "\n"'
  osascript\
 -e 'set ok to do shell script "cat ~/.lock-app-pass|base64 -D"'\
 -e 'tell application "System Events" to keystroke ok'
  osascript -e 'tell application "System Events" to keystroke return'
 fi
 sleep 1
done
