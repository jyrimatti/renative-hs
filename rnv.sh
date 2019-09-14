#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nodejs-10_x cocoapods git -I nixpkgs=channel:nixos-19.03

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

RNV=$DIR/node_modules/.bin/rnv

test -f $RNV || (cd $DIR; echo 'Installing Renative'; PATH=/usr/bin/:$PATH LD=/usr/bin/clang LDPLUSPLUS=/usr/bin/clang++ npm install rnv@0.26.9 --unsafe-perm=true)

# add node wrapper
export PATH=$DIR:$PATH

(test -f $DIR/rnproject/renative.json && cd $DIR/rnproject && cp $DIR/register_addons.js $DIR/rnproject/src/ && ($RNV $@; true)) || (echo "Give 'rnproject' for project Name" && $RNV new && cd $DIR/rnproject && $RNV configure; sed -i 's/^{/{"browser":{"child_process":false,"fs":false,"path":false,"os":false},/' $DIR/rnproject/package.json)
