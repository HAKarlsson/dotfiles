#!/usr/bin/env bash
set -euo pipefail

packages=(
    bash-completion
    ca-certificates
    curl
    git
    gnupg
    libccid
    pcscd
    pinentry-curses
    scdaemon
    tmux
    vim
)
missing=()

for package in "${packages[@]}"; do
    if ! status="$(dpkg-query --show --showformat='${Status}' "$package" 2>/dev/null)" \
        || [[ "$status" != "install ok installed" ]]; then
        missing+=("$package")
    fi
done

if (( ${#missing[@]} == 0 )); then
    printf 'All required Debian packages are already installed.\n'
    exit 0
fi

if ! command -v sudo >/dev/null 2>&1; then
    printf 'sudo is required. As root, run: apt update && apt install sudo\n' >&2
    exit 1
fi

sudo apt update
sudo apt install --yes "${missing[@]}"
