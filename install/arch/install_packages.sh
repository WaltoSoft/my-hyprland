# ----------------------------------------------------- 
# Install packages 
# ----------------------------------------------------- 

installer_packages=(
    "hyprland"
    "waybar"
    "rofi-wayland"
    "alacritty"
    "dunst"
    "xdg-desktop-portal-hyprland"
    "qt5-wayland"
    "qt6-wayland"
    "fuse2"
    "gtk4"
    "libadwaita"
    "hyprpaper"
    "hyprlock"
    "ttf-font-awesome"
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd"
    "jq"
    "python-gobject"
    "less"
    "man-db"
    "vim"
    "chromium"
    "nautilus"
    "gnome-text-editor"
)

installer_yay=(
    "wlogout"
    "appimagetool-bin"
)

# PLEASE NOTE: Add more packages at the end of the following command
_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";
