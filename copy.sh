#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing dotfiles from $DIR to $HOME"

echo "bash_profile"
echo -e "\nsource \"$DIR/bash_profile\"" >> "$HOME/.bash_profile"
echo "chromium_profile"
echo -e "source \"$DIR/chromium_profile\"" >> "$HOME/.bash_profile"
echo ".gitconfig"
ln -sf "$DIR/git-config" ~/.gitconfig
echo ".vimrc"
echo -e "\nsource $DIR/vimrc >> "$HOME/.vimrc"

echo "Done"

echo ""
echo "Make sure to create a:"
echo " * $DIR/gitconfig.local to store the username & email address."
echo " * $DIR/ps1-shortener.local to add shortened paths"
echo ""


