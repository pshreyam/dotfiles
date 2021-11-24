h=`date +%H`

if [ $h -lt 12 ]; then
  echo Guten Morgen, Shreyam!
elif [ $h -lt 18 ]; then
  echo Guten Nachmittag, Shreyam!
elif [ $h -lt 20 ]; then
  echo Guten Abend, Shreyam!
else
  echo Gute Nacht, Shreyam!
fi
