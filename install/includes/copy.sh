# Remove existing symlinks
for df in "${backup_files[@]}"
do
    if [ -L "${df}" ]; then
        rm ${df}
        echo ":: Symlink $df removed"
    fi
done

# Copy configuration to dotfiles folder
rsync -avhp -I $my_hyprland_folder/$version/ ~/
echo ":: Dotfiles installed in ~/.config/"
