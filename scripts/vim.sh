#!/usr/bin/env bash
set -euo pipefail

plug_path="$HOME/.vim/autoload/plug.vim"
if [[ -f "$plug_path" ]]; then
    exit 0
fi

mkdir -p -- "$(dirname -- "$plug_path")"
download="$(mktemp "${plug_path}.XXXXXX")"
trap 'rm -f -- "$download"' EXIT

curl --fail --location --silent --show-error \
    --output "$download" \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv -- "$download" "$plug_path"
printf 'Installed vim-plug at %s\n' "$plug_path"
