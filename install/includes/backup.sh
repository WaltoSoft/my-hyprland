backup_files=(
    ".config/alacritty"
    ".config/dunst"
    ".config/hypr"
    ".config/my-hyprland"
    ".config/rofi"
    ".config/waybar"
    ".config/wlogout"
    ".bashrc"
)

echo -e "${GREEN}"
figlet "Backup"
echo -e "${NONE}"
echo "The script can create a backup of you existing configurations in .config and your .bashrc"
if gum confirm "Do you want to create a backup now" ;then

    # Create my-hyprland folder
    if [ ! -d $my_hyprland_folder ] ;then
        mkdir $my_hyprland_folder
    fi

    # Get current timestamp
    datets=$(date '+%Y%m%d%H%M%S')

    # Create backup folder
    if [ ! -d $my_hyprland_folder/archive ] ;then
        mkdir $my_hyprland_folder/archive
    fi

    # Create backup folder
    if [ ! -d $my_hyprland_folder/backup ] ;then
        mkdir $my_hyprland_folder/backup
    else
        mkdir $my_hyprland_folder/archive/$datets
        cp -r $my_hyprland_folder/backup/. $my_hyprland_folder/archive/$datets/
    fi

    for df in "${backup_files[@]}"
    do
        if [ -d ~/$df ] ;then
            echo ":: Backup of $df"
            mkdir -p $my_hyprland_folder/backup/$df
            cp -r ~/$df $my_hyprland_folder/backup/$df
        fi
        if [ -f ~/$df ] && [ ! -L "${df}" ] ;then
            echo ":: Backup of $df"
            cp ~/$df $my_hyprland_folder/backup/$df
        fi
    done
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo ":: Backup skipped"
fi
