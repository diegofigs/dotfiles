pacman-backup:
	pacman -Qqetn > .pkglist.txt

pacman-restore:
	sudo pacman -S --needed - < .pkglist.txt
