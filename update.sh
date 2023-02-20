rm -r sway waybar zathura nvim rofi xkb alacritty dunst zsh 
cp -r ~/.config/sway ./
cp -r ~/.config/waybar ./
rm ./waybar/bin/forest
cp -r ~/.config/zathura ./
cp -r ~/.config/nvim ./
rm ./nvim/intelephense_license_key
rm ./nvim/lazy-lock.json
cp -r ~/.config/rofi ./
cp -r ~/.config/xkb ./
cp -r ~/.config/alacritty ./
cp -r ~/.config/dunst ./
rm -r ./fcitx5
mkdir ./fcitx5
cp -r ~/.local/share/fcitx5/themes ./fcitx5/
mkdir ./zsh
cp -r ~/.zshrc ./zsh/zshrc
cp -r ~/.p10k.zsh ./zsh/p10k.zsh


