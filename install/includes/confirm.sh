INSTALL_ACTION=""

if [ -d $HYPRLAND_CONFIG_FOLDER ] ;then
    INSTALL_ACTION = "Update"
else
    INSTALL_ACTION "Installation"
fi
echo -e "${NONE}"
echo "This script will ${INSTALL_ACTION} the my-hyprland configuration."
echo "NVIDIA GPUs aren't officially supported by Hyprland. But you can give it a try..."
echo
if gum confirm "DO YOU WANT TO START NOW?" ;then
    echo
    echo ":: Installing Hyprland and required packages"
    echo
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo
    echo ":: Installation canceled"
    exit;
fi
