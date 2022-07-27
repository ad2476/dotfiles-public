#!/bin/bash

# Installs necessary dependencies and sets up the filesystem for dotfiles in
# this repo to work.
# Run this script with INSTALL_POWERLINE_FONTS=1 to additionally install
# powerline fonts on the system.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

DEVICE=$(hostname -s)

case $(uname) in

  "Linux")
    echo "Performing setup for linux"
    $DIR/init/setup-linux
    ;;

  "Darwin")
    echo "Performing setup for MacOS"
    $DIR/init/setup-macos
    ;;
esac

if [ ! -d "${DIR}/fonts" ] && [ -n "$INSTALL_POWERLINE_FONTS" ]; then
  echo "[setup] Installing powerline fonts"
  git clone https://github.com/powerline/fonts
  cd fonts
  ./install.sh
  cd ..
fi

ZSH_THEME_FILE="$DIR/zsh-theme"
if [ ! -f "$ZSH_THEME_FILE" ]; then
  DEFAULT_ZSH_THEME="clean"
  echo "[setup] Setting zsh theme in $ZSH_THEME_FILE to: $DEFAULT_ZSH_THEME"
  echo -n $DEFAULT_ZSH_THEME > $DIR/zsh-theme
fi
ln -s $DIR/zsh-theme $HOME/.zsh-theme

echo "[setup] Symlinking dotfiles to $HOME"

device_zshrc="$DIR/zshrc.$DEVICE"
touch -a $device_zshrc
echo "[setup] Created $device_zshrc. Edit this file for device-specific config."

ln -sfn $DIR/.vimrc $HOME/.vimrc
ln -sfn $DIR/.tmux.conf $HOME/.tmux.conf
ln -sfn $DIR/.Xresources $HOME/.Xresources
ln -sfn $DIR/.zshrc $HOME/.zshrc
ln -sfn $device_zshrc "$HOME/.zshrc.local"
ln -sfn "${DIR}/nvim" $HOME/.config/nvim
ln -sfn $DIR/starship.toml $HOME/.config/starship.toml

SHELDON_DIR="$HOME/.sheldon"
mkdir -p $SHELDON_DIR
ln -sfn "${DIR}/sheldon/plugins.toml" $SHELDON_DIR

echo "[setup] Installing vim-plug to ~/.local/share/nvim/site/autoload/plug.vim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

command -v nvim >/dev/null && \
  echo "[setup] Installing neovim plugins" && \
  nvim -es -u $DIR/nvim/init.vim -i NONE +PlugInstall "+CocInstall coc-tsserver coc-json" +qa

echo "[setup] Compiling terminfo file"

tic -x $DIR/tmux-256color.terminfo

echo "For tmux themeing, run: ./util/tmux-theme"
echo "For device-specific zsh settings, edit zshrc.$DEVICE"

