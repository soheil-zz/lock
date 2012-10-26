cp ../birdtooth/birdtooth/build/birdtooth/Build/Products/Debug/birdtooth.app/Contents/MacOS/birdtooth birdtooth/
cp ../birdtooth/birdtooth/build/birdtooth/Build/Products/Debug/birdtooth.app/Contents/Resources/en.lproj/MainMenu.nib birdtooth/
cp ../birdtooth/birdtooth/build/birdtooth/Build/Products/Debug/birdtooth.app/Contents/Info.plist birdtooth/
echo -e "#!/bin/bash\n" > Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "mkdir /usr/local/bin/birdtooth\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockappbt|base64`'|base64 -D> ~/lockappbt\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "echo '`cat lockappbt-wrapper|base64`'|base64 -D> ~/lockappbt-wrapper\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "echo '`cat birdtooth/birdtooth|base64`'|base64 -D> /usr/local/bin/birdtooth/birdtooth\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "echo '`cat birdtooth/Info.plist|base64`'|base64 -D> /usr/local/bin/birdtooth/Info.plist\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
echo -e "echo '`cat birdtooth/MainMenu.nib|base64`'|base64 -D> /usr/local/bin/birdtooth/MainMenu.nib\n" >> Lock\ App\ BT.app/Contents/MacOS/run.sh
cat run.src >> Lock\ App\ BT.app/Contents/MacOS/run.sh
hdiutil create LockAppBT.dmg -srcfolder Lock\ App\ BT.app/ -ov
scp LockAppBT.dmg root@pubbay.com:/home/content/pub/lockapp
scp lockappbt root@pubbay.com:/home/content/pub/lockappbt
