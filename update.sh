rm -r sway waybar zathura rofi dunst swaylock applications
cp -r ~/.local/share/applications ./
cp -r ~/.config/sway ./
cp -r ~/.config/swaylock ./
cp -r ~/.config/waybar ./
rm ./waybar/bin/forest
rm ./waybar/config.hypr
rm ./waybar/style.css.sway
mv ./waybar/config.sway ./waybar/config
cp -r ~/.config/zathura ./
cp -r ~/.config/rofi ./
cp -r ~/.config/dunst ./
cp /etc/environment.sway ./environment


