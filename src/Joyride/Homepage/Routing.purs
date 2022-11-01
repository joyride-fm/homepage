module Joyride.Homepage.Routing where

import Prelude

import Data.Generic.Rep (class Generic)
import Routing.Duplex (RouteDuplex', root)
import Routing.Duplex.Generic as G
import Routing.Duplex.Generic.Syntax ((/))

data Route = Home | MMM | Nyaa

derive instance genericRoute :: Generic Route _

route :: RouteDuplex' Route
route = root $ G.sum
  { "Home": G.noArgs
  , "MMM": "mmm" / G.noArgs
  , "Nyaa": "nyaa" / G.noArgs
  }