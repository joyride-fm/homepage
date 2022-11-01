module Joyride.Homepage.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (curry, snd)
import Data.Tuple.Nested ((/\))
import Debug (spy)
import Deku.Control (switcher)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (create)
import Joyride.Homepage.GamePage.MMM (mmm)
import Joyride.Homepage.GamePage.Nyaa (nyaa)
import Joyride.Homepage.Index (indexPage)
import Joyride.Homepage.Routing (Route(..), route)
import Routing.Duplex (parse)
import Routing.Hash (getHash, matchesWith, setHash)

main :: Effect Unit
main = do
  h <- getHash
  when (h == "") do
    setHash "/"
  routing <- create
  runInBody
    ( switcher
        ( snd >>> case _ of
            Home -> indexPage
            MMM -> mmm
            Nyaa -> nyaa
        )
        routing.event
    )
  _ <- matchesWith (parse route) (curry routing.push)
  routing.push (Nothing /\ Nyaa)
  pure unit
