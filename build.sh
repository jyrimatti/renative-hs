#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash cacert rsync -I nixpkgs=channel:nixos-19.03
set -eu

app=$(basename *.cabal .cabal)

nix-shell -I nixpkgs=channel:nixos-19.03 --run "cabal new-configure --ghcjs; cabal new-build --ghcjs"

sed -i 's/var h$currentThread = null;/originalProcess=process; process=undefined; var h$currentThread=null;/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
sed -i 's/h$main(h$mainZCZCMainzimain);/h$main(h$mainZCZCMainzimain) ; process = originalProcess;/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js

sed -i 's/function h$ap_1_0(h$RTS_577)/function h$ap_1_0_deleted(h$RTS_577)/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
sed -i '0,/function h$ghcjsbn_toDouble_b/s/function h$ghcjsbn_toDouble_b/function h$ghcjsbn_toDouble_b_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
sed -i '0,/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e/s/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js

sed -i 's/use strict//g' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js

rsync --checksum dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js ./rnproject/src/
