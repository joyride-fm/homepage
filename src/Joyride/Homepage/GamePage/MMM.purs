module Joyride.Homepage.GamePage.MMM where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Joyride.Homepage.GamePage (gamePage)

mmm :: Nut
mmm = gamePage
  { background: "bg-mansion"
  , title: text_ "Mystery Mansion Madness"
  , body: D.div_
      [ D.p_
          [ text_ "In this eight-player game based on a track by"
          , D.a (oneOf [ pure (D.Href := "https://soundcloud.com/fumieval/") ]) [ text_ "DJ Monad" ]
          , text_ ", use the orange tiles to rotate around the pipe and get to higher-scoring lanes."
          ]
      , D.div_ [ D.a (oneOf [ pure (D.Href := "https://mmm.joyride.fm"), klass_ "inline-flex items-center rounded-md border no-underline border-transparent bg-indigo-600 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2" ]) [ text_ "Play now!" ] ]
      , D.div_ [ D.a (oneOf [ klass_ "", pure (D.Href := "https://www.iubenda.com/privacy-policy/74641494") ]) [ text_ "Privacy policy" ] ]
      ]
  }