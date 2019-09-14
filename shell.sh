#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash -I nixpkgs=channel:nixos-19.03

set -eu

NIXPKGS_ALLOW_BROKEN=1 nix-shell -I nixpkgs=channel:nixos-19.03 "$@"
