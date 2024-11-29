echo -e "${GREEN}"
figlet "Reboot"
echo -e "${NONE}"
echo "A reboot of your system is recommended."
echo
if gum confirm "Do you want to reboot your system now?" ;then
    source install/includes/cleanup.sh
    gum spin --spinner dot --title "Rebooting now..." -- sleep 3
    systemctl reboot
elif [ $? -eq 130 ]; then
    source install/includes/cleanup.sh
    exit 130
else
    source install/includes/cleanup.sh
    echo ":: Reboot skipped"
fi
echo ""
