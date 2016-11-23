{-# LANGUAGE StaticPointers #-}
module ALib.Things where

import GHC.StaticPtr
import ALib.Types

thing1 :: StaticPtr AThing
thing1 = static (AThing "hello")

dummy :: ()
dummy = ()
