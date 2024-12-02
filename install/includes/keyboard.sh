if [ ! -f ~/.config/hypr/conf/input.conf ] ;then
    keyboard_layout="us" 
    SEARCH="kb_layout = us"
    REPLACE="kb_layout = $keyboard_layout"
    sed -i -e "s/$SEARCH/$REPLACE/g" $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION/.config/hypr/conf/input.conf
    echo ":: Keyboard layout changed to $keyboard_layout"
    echo
else
    rm $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION/.config/hypr/conf/input.conf
fi
