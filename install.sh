#!/bin/bash

# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.git \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.nodejs \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.cargo \
	nixpkgs.alacritty \
	nixpkgs.ranger \
	nixpkgs.vim \
	nixpkgs.exa

# stow dotfiles
stow alacritty
stow bash
stow bin
stow git
stow ideavim
stow nvim
stow ranger
stow tmux
stow vim
stow x
stow zsh

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# TODO: install neovim from source

