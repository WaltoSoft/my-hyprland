PACMAN_PACKAGES=(
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
  "git"
  "less"
  "man-db"
  "vim"
  "chromium"
  "nautilus"
  "gnome-text-editor"
)

YAY_PACKAGES=(
  "wlogout"
  "appimagetool-bin"
)

_installPackages "${PACMAN_PACKAGES[@]}";
_installPackagesYay "${YAY_PACKAGES[@]}";
