#!/bin/sh

PPNO=Packages-puppy-noarch-official
DIR=pet_packages-noarch

rm -f /tmp/$PPNO
cd $DIR
for pet in *.pet; do
	specs=`tar xvf "$pet" --no-anchored 'pet.specs' 2>/dev/null`
	cat $specs >> /tmp/${PPNO}
	rm -rf ${pet%.*}
done
cd - >/dev/null 2>&1
cat /tmp/$PPNO | LC_COLLATE=C sort  > $PPNO
