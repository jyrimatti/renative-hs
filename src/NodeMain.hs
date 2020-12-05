{-# LANGUAGE NoImplicitPrelude #-}

import Data.Text.IO (putStrLn)
import Prelude (Boolean(True), (>>=), IO)
import React.Flux (reactRenderToString)
import Views (app)

main :: IO ()
main = reactRenderToString True app () >>= T.putStrLn
