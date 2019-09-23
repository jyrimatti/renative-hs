#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash cacert -I nixpkgs=channel:nixos-19.03
set -eu

nix-shell -I nixpkgs=channel:nixos-19.03 --run "cabal v1-clean" 
./build.sh
