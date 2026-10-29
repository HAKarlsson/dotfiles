# Dotfiles

Personal dotfiles for Debian. Rootless Docker is assumed to be configured
separately; the Bash configuration sets `DOCKER_HOST` to its per-user socket.

## Installation

Run the installer as your normal user with sudo access:

```sh
./install.sh
```

The installer first checks Debian's package database and runs `sudo apt update`
and `sudo apt install --yes` only if required packages are missing. It installs
Vim, tmux, Git, curl, CA certificates, Bash completion, and GnuPG with terminal
pinentry and PC/SC smartcard support. If sudo is missing, install it as root
and grant your user sudo access before running the installer.

Keep the repository in its installed location: `dot-*` files are symlinked into
your home directory. Existing files are moved to a `.backup` path; an existing
backup is never overwritten.

Application-specific setup lives in `scripts/` and runs after the dotfiles are
linked. GnuPG setup downloads and imports the public key from
https://keys.openpgp.org/vks/v1/by-keyid/95D4AD82935C1692, so it requires an
internet connection. Vim setup installs vim-plug only
when `~/.vim/autoload/plug.vim` is missing. Run `:PlugInstall` in Vim to install
the configured plugins. Vim creates `~/.vim/undodir` with private permissions
on startup for persistent undo.

Scripts can also be run individually, for example:

```sh
bash scripts/packages.sh
bash scripts/vim.sh
```
