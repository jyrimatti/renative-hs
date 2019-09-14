#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash -I nixpkgs=channel:nixos-19.03
set -eu

port=${1:-8080}

nix-shell -I nixpkgs=channel:nixos-19.03 --run "GHCJSI_PORT=$port cabal repl"

