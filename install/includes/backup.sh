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

clear
_displayFiglet "Backup"
echo "The script can create a backup of you existing configurations in .config and your .bashrc"
if gum confirm "Do you want to create a backup now" ;then

    # Create my-hyprland folder
    if [ ! -d $HYPRLAND_FOLDER ] ;then
        mkdir $HYPRLAND_FOLDER
    fi

    # Get current timestamp
    datets=$(date '+%Y%m%d%H%M%S')

    # Create backup folder
    if [ ! -d $HYPRLAND_FOLDER/archive ] ;then
        mkdir $HYPRLAND_FOLDER/archive
    fi

    # Create backup folder
    if [ ! -d $HYPRLAND_FOLDER/backup ] ;then
        mkdir $HYPRLAND_FOLDER/backup
    else
        mkdir $HYPRLAND_FOLDER/archive/$datets
        cp -r $HYPRLAND_FOLDER/backup/. $HYPRLAND_FOLDER/archive/$datets/
    fi

    for df in "${backup_files[@]}"
    do
        if [ -d ~/$df ] ;then
            echo ":: Backup of $df"
            mkdir -p $HYPRLAND_FOLDER/backup/$df
            cp -r ~/$df $HYPRLAND_FOLDER/backup/$df
        fi
        if [ -f ~/$df ] && [ ! -L "${df}" ] ;then
            echo ":: Backup of $df"
            cp ~/$df $HYPRLAND_FOLDER/backup/$df
        fi
    done
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo ":: Backup skipped"
fi
