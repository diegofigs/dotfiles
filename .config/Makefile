pacman-backup:
	pacman -Qqetn > pkglist.txt
	pacman -Qqem > foreignpkglist.txt

pacman-restore:
	sudo pacman -S --needed - < pkglist.txt

pacman-clean:
	pacman -Qtdq | sudo pacman -Rns -
