# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! "$(uname -s)" = 'Darwin' ]; then
    if grep -q Microsoft /proc/version; then
        # Ubuntu on Windows using the Linux subsystem
        alias open='explorer.exe';
    else
        alias open='xdg-open';
    fi
fi

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

function pacbackup() {
    pacman -Qqen > ~/.pkglist.txt
    pacman -Qqm > ~/.aurlist.txt
}

function pacrestore() {
    sudo pacman -S --needed --noconfirm - < ~/.pkglist.txt
    yay -S --needed --noconfirm - < ~/.aurlist.txt
}

function pacclean() {
    pacman -Qtdq | sudo pacman -Rns -
}
