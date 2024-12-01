if [ -d $HYPRLAND_CONFIG_FOLDER/settings ] ;then
  clear
  _displayFiglet "Restore Settings"
  echo ":: The script has detected an existing settings folder."
  if gum confirm "Do you want to restore the settings?" ;then
    cp -r $HYPRLAND_CONFIG_FOLDER/settings/. $HYPRLAND_VERSION_COPY_CONFIG_FOLDER/settings/
  elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit
  else
    echo ":: Restore skipped"
  fi
fi
