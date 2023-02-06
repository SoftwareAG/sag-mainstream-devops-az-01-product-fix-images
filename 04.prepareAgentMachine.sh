#!/bin/sh

# shellcheck source=/dev/null

. ./setEnv.sh
. "${SUIF_CACHE_HOME}/01.scripts/commonFunctions.sh"

logI "Updating OS software"
sudo apt-get -y update

logI "Installing required libraries..."
sudo apt-get -y install cifs-utils wget apt-transport-https software-properties-common

. /etc/os-release
logI "Installing powershell, OS version is ${VERSION_ID} ..."
wget -q https://packages.microsoft.com/config/ubuntu/${VERSION_ID}/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
sudo apt-get -y update
# Install PowerShell
sudo apt-get -y install powershell
logI "Machine prepared successfully"
