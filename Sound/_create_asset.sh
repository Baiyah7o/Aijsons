#!/bin/bash
FILENAME="_soundfiles"
mkdir -p ./mp3
while read -r LINES; do
	if [ ! -e "./mp3/$LINES.mp3" ]; then
    #     echo -e "$LINES already exists" 
    # else
	    echo -e " create ./mp3/$LINES.mp3"
	    gtts-cli -l en  "$LINES" --output ./mp3/"$LINES".mp3
	fi;
done <$FILENAME 

echo -e "Set volume up for all mp3 files."
mp3gain -r -k -d 12  ./mp3/*.mp3

dir2ogg -Q -q 10 -r ./mp3

mv ./mp3/*.ogg ./


mv "Deebuff.ogg" "Debuff.ogg" 
mv "Deebuff expired.ogg" "Debuff expired.ogg"
mv "Deebuff Avoid.ogg" "Debuff Avoid.ogg"
mv "Beehind.ogg" "Behind.ogg"


TEMPFILE=.tempfile
ASSETFILE=../assets.lua
sed -i "/Register(\"sound\"/d" $ASSETFILE
ls -1 *.ogg  > $TEMPFILE
sed -i "s/\.ogg//g" $TEMPFILE
while read -r ASSETLINES; do
    echo -e "$ASSETLINES"
    echo -e "Aijsons:Register(\"sound\", \"Aijsons, $ASSETLINES\", [[Interface\\Addons\\Aijsons\\Sound\\$ASSETLINES.ogg]])"  >> $ASSETFILE
done <$TEMPFILE 
rm $TEMPFILE
