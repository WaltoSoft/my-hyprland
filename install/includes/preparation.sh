if [ ! -d $my_hyprland_folder ] ;then
    mkdir $my_hyprland_folder 
fi
if [ -d $my_hyprland_folder/$version ] ;then
    rm -rf $my_hyprland_folder/$version
fi
cp -r dotfiles $my_hyprland_folder/$version
echo ":: my-hyprland configuration prepared in ${my_hyprland_folder}/$version"
