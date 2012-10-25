echo -e "#!/bin/bash\n" > Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockappbt|base64`'|base64 -D> ~/lockappbt\n" >> Lock\ App.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockappbt-wrapper|base64`'|base64 -D> ~/lockappbt-wrapper\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
cat run.src >> Lock\ App\ BT.app/Contents/MacOS/run.sh
hdiutil create LockAppBT.dmg -srcfolder Lock\ App\ BT.app/ -ov
scp LockAppBT.dmg root@pubbay.com:/home/content/pub/lockapp
scp lockappbt root@pubbay.com:/home/content/pub/lockappbt
