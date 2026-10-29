#!/usr/bin/env bash
set -euo pipefail

dotfiles_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
gnupg_home="${GNUPGHOME:-"$HOME/.gnupg"}"
mkdir -p -- "$gnupg_home"
chmod 700 -- "$gnupg_home"
gpg --batch --import "$dotfiles_dir/hakarlsson@proton.me.asc"
