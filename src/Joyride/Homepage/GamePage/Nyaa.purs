module Joyride.Homepage.GamePage.Nyaa where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Joyride.Homepage.GamePage (gamePage)

nyaa :: Nut
nyaa = gamePage
  { background: "bg-cat"
  , title: text_ "Nyaa"
  , body: D.div_
      [ D.p_
          [ text_ "A mysterious cat leads you through a series of rhythmic battle royales."
          ]
      , D.div_ [D.a (oneOf [ pure (D.Href := "https://nyaa.joyride.fm"), klass_ "inline-flex items-center rounded-md border no-underline border-transparent bg-indigo-600 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2" ]) [ text_ "Play now!" ]]
      , D.div_ [ D.a (oneOf [ klass_ "", pure (D.Href := "https://www.iubenda.com/privacy-policy/84161620") ]) [ text_ "Privacy policy" ] ]
      ]
  }