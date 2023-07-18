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
rm -r ./fcitx5
mkdir ./fcitx5
cp -r ~/.local/share/fcitx5/themes ./fcitx5/
cp /etc/environment.sway ./environment


