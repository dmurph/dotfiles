#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "Installing dotfiles from $DIR to $HOME\n"

BASH_PROFILE_FILE="$HOME/.bash_profile"
BASH_PROFILE_STRING="source \"$DIR/bash_profile\""
CHROMIUM_PROFILE_STRING="source \"$DIR/chromium_profile\""
VIMRC_FILE="$HOME/.vimrc"
VIMRC_STRING="source $DIR/vimrc"
GITCONFIG_DOTFILE_FILE="$HOME/.gitconfig"
GITCONFIG_FILE="$DIR/git-config"
GITCONFIG_LOCAL_FILE="$DIR/gitconfig.local"
EMACS_FILE="$DIR/init.el"
EMACS_DOTFILE_FILE="$HOME/.emacs"

echo "bash_profile..."
if grep -q "$BASH_PROFILE_STRING" "$BASH_PROFILE_FILE"; then
  echo -e "bash_profile already sourced in $BASH_PROFILE_FILE\n"
else
  echo $BASH_PROFILE_STRING >> $BASH_PROFILE_FILE
  echo -e "done.\n"
fi

echo "chromium_profile..."
if grep -q "$CHROMIUM_PROFILE_STRING" "$BASH_PROFILE_FILE"; then
  echo -e "chromium_profile already sourced in $BASH_PROFILE_FILE.\n"
else
  echo $CHROMIUM_PROFILE_STRING >> $BASH_PROFILE_FILE
  echo -e "done.\n"
fi

echo ".gitconfig..."
ln -sf "$GITCONFIG_FILE" "$GITCONFIG_DOTFILE_FILE"
echo -e "done.\n"

echo "Ensuring gitconfig includes the correct local file..."
if grep -q "gitconfig.local" "$GITCONFIG_DOTFILE_FILE"; then
  echo -e "gitconfig.local already sourced in $GITCONFIG_DOTFILE_FILE.\n"
else
  echo -e "\n[include]\n  path=$GITCONFIG_LOCAL_FILE" >> $GITCONFIG_DOTFILE_FILE
  echo -e "done.\n"
fi

echo ".vimrc..."
if grep -q "$VIMRC_STRING" "$VIMRC_FILE"; then
  echo -e "vimrc already sourced in $VIMRC_FILE.\n"
else
  echo $VIMRC_STRING >> $VIMRC_FILE
  echo -e "done.\n"
fi

echo ".emacs..."
ln -sf "$EMACS_FILE" "$EMACS_DOTFILE_FILE"
echo -e "done.\n"

echo "Complete."

echo ""
echo "Make sure to create a:"
echo " * $DIR/gitconfig.local to store the username & email address."
echo "   (for example, "
echo " * $DIR/ps1-shortener.local to add shortened paths"
echo ""


