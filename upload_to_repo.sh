#!/bin/sh
set -eu

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="$HOME"

FILES="
.config/gtk-3.0/settings.ini
.config/lf/lfrc
.config/lf/icons
.config/nvim/init.vim
.config/picom.conf
.config/zsh/aliases
.config/zsh/.zprofile
.config/zsh/.zshrc
.xinitrc
.xprofile
.zshenv
"

echo "Uploading selected dotfiles from HOME → repo"
echo

for path in $FILES; do
    src="$HOME_DIR/$path"
    dst="$REPO_DIR/$path"

    if [ ! -e "$src" ]; then
        echo "⚠ Skipping missing: $path"
        continue
    fi

    mkdir -p "$(dirname "$dst")"

    if [ -d "$src" ]; then
        rsync -a "$src/" "$dst/"
    else
        cp -f "$src" "$dst"
    fi

    echo "✓ $path"
done

#################################
# dwmblocks scripts (/opt → repo)
#################################

DWM_SRC="/opt/dwmblocks"
DWM_DST="$REPO_DIR/dwmblocks-scripts"

if [ -d "$DWM_SRC" ]; then
    echo
    echo "Uploading dwmblocks scripts → repo"

    mkdir -p "$DWM_DST"
    rsync -av --delete \
        --chmod=Fugo+rx \
        "$DWM_SRC/" "$DWM_DST/"
else
    echo "⚠ /opt/dwmblocks not found, skipping"
fi


echo
echo "✔ Upload complete"

