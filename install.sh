#!/usr/bin/env bash

msg() { echo "--- $@" 1>&2; }
detail() { echo "	$@" 1>&2; }

for i in git vim; do
  command -v $i >/dev/null
  if [ $? -ne 0 ] ; then
    msg "Installer requires ${i}. Please install $i and try again."
    exit 1
  fi
done

endpath="$HOME/.flp-vim"

if [ ! -e $endpath/.git ]; then
  msg "Cloning filipelinhares/dotvim"
  git clone https://github.com/filipelinhares/dotvim.git $endpath
else
  msg "Existing installation detected"
  msg "Updating from filipelinhares/dotvim"
  cd $endpath && git pull
fi

if [ -e ~/.vim/colors ]; then
  msg "Preserving color scheme files"
  cp -R ~/.vim/colors $endpath/colors
fi

today=`date +%Y%m%d_%H%M%S`
msg "Backing up current vim config"
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today && detail "$i.$today"; done

msg "Creating symlinks"
detail "~/.vimrc -> $endpath/.vimrc"
ln -sf $endpath/.vimrc $HOME/.vimrc

if [ ! -e $HOME/.vim/plugged ]; then
  msg "Installing vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qa
