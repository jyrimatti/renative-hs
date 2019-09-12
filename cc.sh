#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash rsync
set -eu

app=$(basename *.cabal .cabal)

test -e dist || (mkdir dist && mkdir dist/build && mkdir dist/build/$app)

while true; do
  printf '\033\143' #clear
  nix-shell --run "cabal new-configure --ghcjs && time cabal new-build --ghcjs $@; true"

  # used by ghcjsi repl
  test -f dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js && sed -i 's/h$main(h$mainZCZCMainzimain);/module.exports = { h$main: h$main, h$killThread: h$killThread, h$d: h$d, h$baseZCControlziExceptionziBasezinonTermination: h$baseZCControlziExceptionziBasezinonTermination };h$main(h$mainZCZCMainzimain);/g' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js

  sed -i 's/function h$ap_1_0(h$RTS_577)/function h$ap_1_0_deleted(h$RTS_577)/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
  sed -i '0,/function h$ghcjsbn_toDouble_b/s/function h$ghcjsbn_toDouble_b/function h$ghcjsbn_toDouble_b_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
  sed -i '0,/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e/s/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
  sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
  sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js
  sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e_deleted/' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js

  sed -i 's/use strict//g' dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js

  rsync --checksum dist-newstyle/build/*/ghcjs-*/$app-*/x/$app/build/$app/$app.jsexe/all.js rnproject/

  nix-shell -p fswatch --run "fswatch -1 -r -i '.*[.]hs$' --event Created --event Updated --event Removed --event Renamed --event MovedFrom --event MovedTo src; true"
done

