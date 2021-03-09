#!/bin/sh

Installnvim(){
	if [ ! -n "~/.config" ]
	then
		echo "[INFO] Makedir: ~/.config "
		mkdir ~/.config
	fi

	cp -r $(pwd)/nvim ~/.config/

	wget https://github.com/junegunn/vim-plug/raw/master/plug.vim
	if [ ! -n "~/.local/share/nvim/site/autoload" ]
	then
		mkdir -p ~/.local/share/nvim/site/autoload
	fi
	mv plug.vim ~/.local/share/nvim/site/autoload/

	nvim -c "PlugInstall" ./nviminstall.info
	nvim -c "CocInstall coc-clangd coc-cmake coc-emmet coc-git coc-highlight coc-jedi coc-json coc-pyright coc-jedi coc-sh coc-snippets coc-vimlsp coc-yaml coc-syntax coc-pairs" ./nviminstall.info
}
