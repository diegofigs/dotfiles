pacrestore:
	sudo pacman -S --needed --noconfirm - < ~/.pkglist.txt
	yay -S --needed --noconfirm - < ~/.aurlist.txt

pacclean:
	pacman -Qtdq | sudo pacman -Rns -

