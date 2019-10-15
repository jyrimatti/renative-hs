#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nodejs-10_x cocoapods git -I nixpkgs=channel:nixos-19.03

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

RNV=$DIR/node_modules/.bin/rnv

test -f $RNV || (
    cd $DIR;
    echo 'Installing Renative';
    PATH=/usr/bin/:$PATH LD=/usr/bin/clang LDPLUSPLUS=/usr/bin/clang++ npm install rnv@0.26.9 --unsafe-perm=true;
    npm install google-closure-compiler;
    npm install source-map-support
    )

sed -i 's/const transformResult =/const transformResult= filename ===  "src\/all.js" ? { ast: null } :/' ./rnproject/node_modules/metro/src/JSTransformer/worker.js
sed -i 's/const _generateImportNames =/const _generateImportNames= filename ===  "src\/all.js" ? { importDefault: "renative_hs_importDefault", importAll: "renative_hs_importAll" } :/' ./rnproject/node_modules/metro/src/JSTransformer/worker.js
sed -i 's/var _transformFromAstSync =/var _transformFromAstSync= filename ===  "src\/all.js" ? { ast } : /' ./rnproject/node_modules/metro/src/JSTransformer/worker.js
sed -i 's/var _collectDependencies =/var _collectDependencies= filename ===  "src\/all.js" ? {dependencies: [],dependencyMapName: ""} : /' ./rnproject/node_modules/metro/src/JSTransformer/worker.js
sed -i 's/var _this = this;/var _this = this ; if (filename ===  "src\/all.js") { console.log(new Date() + ": all.js.started");}/' ./rnproject/node_modules/metro/src/JSTransformer/worker.js
sed -i 's/if (options.minify) {/if (filename ===  "src\/all.js") {console.log(new Date() + ": all.js ended"); } if (options.minify){/' ./rnproject/node_modules/metro/src/JSTransformer/worker.js

export NODE_OPTIONS=--max_old_space_size=4096

(test -f $DIR/rnproject/renative.json &&
    cd $DIR/rnproject &&
    cp $DIR/register_addons.js $DIR/rnproject/src/ &&
    ($RNV "$@"; true)) ||
(echo "Give 'rnproject' for project Name" && 
    $RNV new && 
    cd $DIR/rnproject && 
    $RNV configure; 
    sed -i 's/"react-native": "0.59.5",/"react-native": "0.59.10",/' $DIR/rnproject/package.json;
    sed -i 's/^{/{"browser":{"child_process":false,"fs":false,"path":false,"os":false},/' $DIR/rnproject/package.json)
