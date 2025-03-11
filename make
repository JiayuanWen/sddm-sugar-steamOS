#!/bin/bash
RED='\e[1;31m'
GREEN='\e[1;32m'
RESETFONT='\e[0m'

# Stop script if any error occurs
set -e
echo

# Create a folder for archiving later
COMDIR=""
echo -ne "Checking & cleaning remaining folders from previous compilation... \r"
if [ -d ./holoiso-sddm-steamOS ]; then
	rm -r ./holoiso-sddm-steamOS
fi
echo -e "Checking & cleaning remaining folders from previous compilation... Done"
echo -ne "Creating folder for compress... \r"
mkdir ./holoiso-sddm-steamOS;
COMDIR="./holoiso-sddm-steamOS"
echo  -e "Creating folder for compress... Done"

echo -ne "Copying LICENSE... \r"
cp ./LICENSE $COMDIR;
echo -e "Copying LICENSE... Done"

echo -ne "Copying CREDITS... \r"
cp ./CREDITS $COMDIR;
echo -e "Copying CREDITS... Done"

echo -ne "Copying AUTHORS... \r"
cp ./AUTHORS $COMDIR;
echo -e "Copying AUTHORS... Done"

echo -ne "Copying Background.png... \r"
cp ./Background.png $COMDIR;
echo -e "Copying Background.png... Done"

echo -ne "Copying Main QML... \r"
cp ./Main.qml $COMDIR;
echo -e "Copying Main QML... Done"

echo -ne "Copying metadata... \r"
cp ./metadata.desktop $COMDIR;
echo -e "Copying metadata... Done"

echo -ne "Copying theme config... \r"
cp ./theme.conf $COMDIR;
echo -e "Copying theme config... Done"

echo -ne "Copying preview image... \r"
mkdir $COMDIR/previews/
cp ./previews/Preview.png $COMDIR/previews/;
echo -e "Copying preview image... Done"

echo -ne "Copying sddm test script... \r"
cp ./sddmtest $COMDIR;
echo -e "Copying sddm test script... Done"

echo -ne "Copying Asset folder... \r"
cp -r ./Assets $COMDIR;
echo -e "Copying Asset folder... Done"

echo -ne "Copying Components folder... \r"
cp -r ./Components $COMDIR;
echo -e "Copying Components folder... Done"

# Write folder to archive
if type tar > /dev/null; then
    echo -ne "Write sddm theme to archive... \r"
    tar -cvzf holoiso-sddm-steamOS.tar.gz ./holoiso-sddm-steamOS
    echo -e "Write sddm theme to archive... Done"
else
    echo
    echo -e "${RED}'Tar' not installed. Refer to https://www.tecmint.com/install-zip-and-unzip-in-linux/ to install said tool for your distro.${RESETFONT}"
    echo
    rm -rf ./holoiso-sddm-steamOS
    exit 1
fi

# Post-script clean up
rm -rf ./holoiso-sddm-steamOS
echo
echo -e "${GREEN}SDDM theme archived without error. An tar file has been created in repo's root directory.${RESETFONT}"
echo
exit 0

