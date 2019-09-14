#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix nodejs-10_x -I nixpkgs=channel:nixos-19.03
set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

test -f $DIR/node_modules/.bin/react-devtools || (cd $DIR; echo 'Installing Renative'; npm install react-devtools) 

$DIR/node_modules/.bin/react-devtools
