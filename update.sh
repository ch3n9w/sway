rm -r sway waybar zathura rofi xkb kitty dunst zsh swaylock
cp -r ~/.config/sway ./
cp -r ~/.config/swaylock ./
cp -r ~/.config/waybar ./
rm ./waybar/bin/forest
cp -r ~/.config/zathura ./
cp -r ~/.config/rofi ./
cp -r ~/.config/xkb ./
cp -r ~/.config/kitty ./
cp -r ~/.config/dunst ./
rm -r ./fcitx5
mkdir ./fcitx5
cp -r ~/.local/share/fcitx5/themes ./fcitx5/
mkdir ./zsh
cp -r ~/.zshrc ./zsh/zshrc
cp -r ~/.config/zsh ./zsh/


