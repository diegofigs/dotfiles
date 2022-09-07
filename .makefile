pacman-backup:
	pacman -Qqet > .pkglist.txt

pacman-restore:
	sudo pacman -S --needed - < .pkglist.txt
