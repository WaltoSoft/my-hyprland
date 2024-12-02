if [ ! -f ~/.config/hypr/conf/monitor.conf ] ;then
    SEARCH="monitor=,preferred,auto,auto"
    REPLACE="monitor=,preferred,auto,auto"
    sed -i -e "s/$SEARCH/$REPLACE/g" $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION/.config/hypr/conf/monitor.conf    
else
    rm $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION/.config/hypr/conf/monitor.conf
fi
