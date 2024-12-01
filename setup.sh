#!/bin/bash

# -----------------------------------------------------
# Variables
# -----------------------------------------------------
SETUP_INSTALLER_PACKAGES=""
SETUP_INSTALL_BRANCH=""
GREEN='\033[0;32m'
NONE='\033[0m'

# -----------------------------------------------------
# Functions
# -----------------------------------------------------
_isInstalledPacman() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# Install required packages
_installPackagesPacman() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;
    printf "Package not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman --noconfirm -S "${toInstall[@]}";
}
# -----------------------------------------------------


# ----------------------------------------------------- 
# Packages
# ----------------------------------------------------- 
SETUP_INSTALLER_PACKAGES=(
    "wget"
    "unzip"
    "rsync"
    "gum"
    "figlet"
    "git"
    "less"
    "man-db"
)

clear
echo "Initializing Setup"

# ----------------------------------------------------
# Get command line arguments
# ----------------------------------------------------

while getopts ":b:" opt; do
  case "${opt}" in
    b)
      echo "Option -b was triggered, Argument: ${OPTARG}"
      SETUP_INSTALL_BRANCH="${OPTARG}"
      ;;
    :)
      echo "Option -b was triggered, Argument: ${OPTARG}"
      exit 1
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

# ----------------------------------------------------
# Header
# ----------------------------------------------------

echo -e "${GREEN}"
cat <<"EOF"
 _   _                  _                 _   ____       _
| | | |_   _ _ __  _ __| | __ _ _ __   __| | / ___|  ___| |_ _   _ _ __
| |_| | | | | '_ \| '__| |/ _` | '_ \ / _` | \___ \ / _ \ __| | | | '_ \
|  _  | |_| | |_) | |  | | (_| | | | | (_| |  ___) |  __/ |_| |_| | |_) |
|_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_| |____/ \___|\__|\__,_| .__/
       |___/|_|                                                   |_|
EOF
echo "for Billy Walton's Hyprland Configuration"
echo
echo -e "${NONE}"

echo
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
            echo
        break;;
        [Nn]* ) 
            echo "Installation canceled."
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo ":: Installing packages needed for setup"
_installPackagesPacman "${SETUP_INSTALLER_PACKAGES[@]}";

# Create Git folder if not exists
if [ ! -d ~/Git ] ;then
    mkdir ~/Git
    echo ":: Git folder created"
fi

# Change into Downloads directory
cd ~/Git

# Remove existing repo
if [ -d ~/Git/my-hyprland ] ;then
    rm -rf ~/Git/my-hyprland
    echo ":: Existing repo removed"
fi

# Clone the packages
git clone --depth 1 https://github.com/waltosoft/my-hyprland.git
echo ":: Repository my-hyprland cloned"

# Change into the my-hyprland folder
cd ~/Git/my-hyprland

if [ ! -z $SETUP_INSTALL_BRANCH ]; then
  git config --get remote.origin.fetch
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git config --get remote.origin.fetch
  git remote update
  git fetch

  git checkout $SETUP_INSTALL_BRANCH
  echo ":: Changed to ${SETUP_INSTALL_BRANCH} branch"
fi

# Start the script
cd ~/Git/my-hyprland
echo "Starting the installation from directory: ${pwd}"
./install.sh
