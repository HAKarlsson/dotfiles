#!/usr/bin/env bash
set -euo pipefail

dotfiles_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

if ! command -v gpg >/dev/null 2>&1; then
    printf 'GnuPG is required. Install it with: sudo apt-get install gnupg\n' >&2
    exit 1
fi

link_config() {
    local source="$1"
    local target="$2"
    local backup="${target}.backup"

    mkdir -p -- "$(dirname -- "$target")"

    if [[ -L "$target" ]] && [[ "$(readlink -- "$target")" == "$source" ]]; then
        return
    fi

    if [[ -e "$target" || -L "$target" ]]; then
        if [[ -e "$backup" || -L "$backup" ]]; then
            printf 'Cannot back up %s: %s already exists\n' "$target" "$backup" >&2
            return 1
        fi
        mv -- "$target" "$backup"
        printf 'Backed up %s to %s\n' "$target" "$backup"
    fi

    ln -s -- "$source" "$target"
    printf 'Linked %s to %s\n' "$target" "$source"
}

for entry in "$dotfiles_dir"/dot-*; do
    [[ -e "$entry" ]] || continue

    name="${entry##*/dot-}"
    if [[ -d "$entry" ]]; then
        while IFS= read -r -d '' source; do
            relative_path="${source#"$entry"/}"
            link_config "$source" "$HOME/.$name/$relative_path"
        done < <(find "$entry" -type f -print0)
    elif [[ -f "$entry" ]]; then
        link_config "$entry" "$HOME/.$name"
    fi
done

gnupg_home="${GNUPGHOME:-"$HOME/.gnupg"}"
mkdir -p -- "$gnupg_home"
chmod 700 -- "$gnupg_home"
gpg --batch --import "$dotfiles_dir/hakarlsson@proton.me.asc"
