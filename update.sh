rm -r sway waybar zathura rofi dunst swaylock 
cp -r ~/.config/sway ./
cp -r ~/.config/swaylock ./
cp -r ~/.config/waybar ./
rm ./waybar/bin/forest
rm ./waybar/config.hypr
mv ./waybar/style.css.sway ./waybar/style.css
mv ./waybar/config.sway ./waybar/config
cp -r ~/.config/zathura ./
cp -r ~/.config/rofi ./
cp -r ~/.config/dunst ./
cp /etc/environment.sway ./environment


