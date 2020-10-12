#!/bin/bash

cd MineServer

# Download Forge installer
FORGE_INSTALLER_NAME="forge-1.12.2-14.23.5.2854-installer.jar"
FORGE_INSTALLER_URL="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar"
if [ ! -f $FORGE_INSTALLER_NAME ]; then
	wget "${FORGE_INSTALLER_URL}"
else
	echo "Forge installer already downloaded"
fi

echo ""

echo "Running Forge installer..."
java -jar "${FORGE_INSTALLER_NAME}" --installServer

echo ""

# Now install mods
# All mods are stored in GDrive
# https://drive.google.com/drive/folders/1VAo5LHYY2W84oXRHfddb_FflCHsSdJYD
echo "Downloading mods"

if [ ! -d mods ]; then
	mkdir mods
fi
cd mods

declare -a mods_name=(
	"industrialcraft-2-2.8.220-ex112.jar"
)
declare -a mods_url=(
	"https://drive.google.com/uc?export=download&id=1epwUSPnzzT4D6Xsa0KBOJwQkrj1Wj8hl"
)
mods_count=${#mods_name[@]}

for (( i=0; i<${mods_count}; i++ ));
do
   wget -O "${mods_name[$i]}" "${mods_url[$i]}"
done
