if [ ! -d $HYPRLAND_FOLDER ] ;then
    mkdir $HYPRLAND_FOLDER 
fi
if [ -d $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION ] ;then
    rm -rf $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION
fi
cp -r dotfiles $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION
echo ":: my-hyprland configuration prepared in ${HYPRLAND_FOLDER}/${MY_HYPRLAND_VERSION}"
