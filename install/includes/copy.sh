# Remove existing symlinks
for df in "${backup_files[@]}"
do
    if [ -L "${df}" ]; then
        rm ${df}
        echo ":: Symlink $df removed"
    fi
done

# Copy configuration to dotfiles folder
rsync -avhp -I $HYPRLAND_FOLDER/$MY_HYPRLAND_VERSION/ ~/
echo ":: Dotfiles installed in ~/.config/"
