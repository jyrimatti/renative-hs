#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nodejs-10_x cocoapods git -I nixpkgs=channel:nixos-19.03

# nix overrides system clang...
export PATH=/usr/bin/:$PATH

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# add node wrapper
export PATH=$DIR:$PATH

RNV=$DIR/node_modules/.bin/rnv

test -f $RNV || (cd $DIR; echo 'Installing Renative'; npm install rnv)

(test -d $DIR/rnproject && cd $DIR/rnproject && $RNV $@; true) || $RNV new
