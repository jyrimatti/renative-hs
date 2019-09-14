{-# LANGUAGE CPP                       #-}
{-# LANGUAGE DataKinds                 #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses     #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE PolyKinds                 #-}
{-# LANGUAGE ScopedTypeVariables       #-}
{-# LANGUAGE TypeApplications          #-}
{-# LANGUAGE TypeFamilies              #-}
{-# LANGUAGE TypeFamilyDependencies    #-}
{-# LANGUAGE TypeOperators             #-}
{-# LANGUAGE UndecidableInstances      #-}
module Views where

import Prelude (($))
import           React.Flux.Rn.Views (mkControllerView,StoreArg,ReactView)
import           React.Flux.Rn.Components.View
import           React.Flux.Rn.Components.Text
import           Store (AppState)

app :: ReactView ()
app = mkControllerView @'[StoreArg AppState] "My app" $ \_ () ->
    view [ style [ flex 1, justifyContent Center_____, alignItems Center______ ] ] $ do
        text [] "Hello world!"
