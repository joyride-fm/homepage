module Joyride.Homepage.Index
  ( Index
  , SingleGame
  , SingleGameInfo
  , games
  , indexPage
  ) where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((:=))
import Deku.Control (text_)
import Deku.Core (Domable, Nut, fixed)
import Deku.DOM as D
import Deku.Listeners (click_)
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Joyride.Homepage.Assets (catThumbURL, catURL, mansionThumbURL, mansionURL)
import Joyride.Homepage.Routing (Route(..), route)
import Routing.Duplex (parse)
import Routing.Hash (matchesWith, setHash)
import Type.Proxy (Proxy(..))

type SingleGame =
  """
<div>
    <h3>~title~</h3>
    <div class="aspect-w-3 aspect-h-2 w-full overflow-hidden rounded-lg">
        <img ~img~ class="cursor-pointer h-full w-full object-cover object-center" />
    </div>
    <p class="text-base text-gray-500">~txt~</p>
</div>
            """

type Index =
  """<div
      class="min-h-screen bg-gray-50 py-8 flex flex-col justify-center relative overflow-hidden lg:py-12"
    >
      <div
        class="relative w-full px-6 py-12 bg-white shadow-xl shadow-slate-700/10 ring-1 ring-gray-900/5 md:max-w-3xl md:mx-auto lg:max-w-4xl lg:pt-16 lg:pb-28"
      >
        <article class="prose lg:prose-xl">
          <h1 class="">Hi 👋</h1>
          <p class="">
            We're <b>joyride.fm</b>, a small game studio with roots in
            Japan 🇯🇵, Finland 🇫🇮, and the Philippines 🇵🇭.
          </p>
          <p class="">
            We're on a mission to build multi-player rhythm games. While we're
            keeping some classics like judgement lines and tile tapping, we're
            introducing new mechanics like multi-dimensional charts,
            gyroscope-based navigation and dynamic music generation to make
            rhythm gaming as social and fun as jamming with friends.
          </p>
          <p class="">
            Want to know what we're up to these days? Join our
            <a
              class=""
              href="https://discord.gg/gUAPQAtbS8"
              target="_blank"
              >Discord</a>! And if have an itch that only gaming will scratch, play our first
            game, DJ Monad's <a href="https://mmm.joyride.fm" target="_blank">Mystery Mansion Madness</a>!
          </p>
        <h2>Our games</h2>
        <div class="mt-16 grid grid-cols-1 gap-y-16 lg:grid-cols-2 lg:gap-x-8">
            ~games~
        </div>
        </article>
      </div>
    </div>
    """

games :: forall lock payload. Domable lock payload
games = fixed
  [ singleGame
      { title: text_ "Mystery Mansion Madness"
      , img: mansionThumbURL
      , alt: "The mystery mansion."
      , txt: fixed [ text_ "An eight-player game with rotating lanes." ]
      , nav: setHash "/mmm"
      }
  , singleGame
      { title: text_ "Nyaa"
      , img: catThumbURL
      , alt: "A cat saying nyaa."
      , txt: fixed [ text_ "A battle-royal controlled by a very cute cat." ]
      , nav: setHash "/nyaa"
      }
  ]

indexPage :: Nut
indexPage = (Proxy :: Proxy Index) ~~ { games: nut games }

type SingleGameInfo lock payload =
  { title :: Domable lock payload
  , img :: String
  , alt :: String
  , txt :: Domable lock payload
  , nav :: Effect Unit
  }

singleGame :: forall lock payload. SingleGameInfo lock payload -> Domable lock payload
singleGame { title, img, alt, txt, nav } = (Proxy :: Proxy SingleGame) ~~
  { title: nut title
  , img: oneOf
      [ pure (D.Src := img)
      , pure (D.Alt := alt)
      , click_ nav
      ]
  , txt: nut txt
  }

