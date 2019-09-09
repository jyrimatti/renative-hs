#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash

set -eu

NIXPKGS_ALLOW_BROKEN=1 nix-shell "$@"
