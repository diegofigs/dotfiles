pacman-backup:
	pacman -Qqetn > pkglist.txt
	pacman -Qqm > foreignpkglist.txt

pacman-restore:
	sudo pacman -S --needed --noconfirm - < pkglist.txt
	yay --needed --noconfirm - < foreignpkglist.txt

pacman-clean:
	sudo pacman -Rsn $(pacman -Qdtq)