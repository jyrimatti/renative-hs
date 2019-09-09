#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu

port=${1:-8080}

nix-shell --run "GHCJSI_PORT=$port cabal repl"

