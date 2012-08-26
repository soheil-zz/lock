echo -e "#!/bin/bash\n" > Lock\ App.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockapp|base64`'|base64 -D> /usr/local/bin/lockapp\n" >> Lock\ App.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockapp-wrapper|base64`'|base64 -D> /usr/local/bin/lockapp-wrapper\n" >> Lock\ App.app/Contents/MacOS/run.sh
cat Lock\ App.app/Contents/MacOS/run.src >> Lock\ App.app/Contents/MacOS/run.sh
exit
hdiutil create LockApp.dmg -srcfolder Lock\ App.app/ -ov
scp LockApp.dmg root@pubbay.com:/home/content/pub/lockapp
