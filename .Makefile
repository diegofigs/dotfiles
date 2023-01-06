pacrestore:
	yay -S --needed --noconfirm --removemake - < ~/.pkglist.txt
	yay -S --needed --noconfirm --removemake - < ~/.aurlist.txt
pacclean:
	yay -Yc
