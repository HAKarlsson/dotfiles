#!/usr/bin/env bash
set -euo pipefail

gnupg_home="${GNUPGHOME:-"$HOME/.gnupg"}"
mkdir -p -- "$gnupg_home"
chmod 700 -- "$gnupg_home"
curl --fail --silent --show-error --location \
    'https://keys.openpgp.org/vks/v1/by-keyid/95D4AD82935C1692' \
    | gpg --batch --import
