echo -e "#!/bin/bash\n" > Lock\ App.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockapp|base64`'|base64 -D> ~/lockapp\n" >> Lock\ App.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockapp-wrapper|base64`'|base64 -D> ~/lockapp-wrapper\n" >> Lock\ App.app/Contents/MacOS/run.sh
cat run.src >> Lock\ App.app/Contents/MacOS/run.sh
hdiutil create LockApp.dmg -srcfolder Lock\ App.app/ -ov
scp LockApp.dmg root@pubbay.com:/home/content/pub/lockapp
scp lockapp root@pubbay.com:/home/content/pub/lockapp
