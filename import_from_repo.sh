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

echo "Importing selected dotfiles from repo → HOME"
echo

for path in $FILES; do
    src="$REPO_DIR/$path"
    dst="$HOME_DIR/$path"

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
# dwmblocks scripts (repo → /opt)
#################################
DWM_SRC="$REPO_DIR/dwmblocks-scripts"
DWM_DST="/opt/dwmblocks"

if [ -d "$DWM_SRC" ]; then
    echo
    echo "Importing dwmblocks scripts → /opt/dwmblocks"

    sudo mkdir -p "$DWM_DST"
    sudo rsync -av --delete \
        "$DWM_SRC/" "$DWM_DST/"

    sudo chmod +x "$DWM_DST"/* || true
else
    echo "⚠ No dwmblocks-scripts directory in repo, skipping"
fi


echo
echo "✔ Import complete"

