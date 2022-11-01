module Joyride.Homepage.GamePage where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((:=))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Type.Proxy (Proxy(..))

type GamePage =
  """<div
      ~divattr~
    >
      <div
        class="relative w-full px-6 py-12 bg-white shadow-xl shadow-slate-700/10 ring-1 ring-gray-900/5 md:max-w-3xl md:mx-auto lg:max-w-4xl lg:pt-16 lg:pb-28"
      >
        <article class="prose lg:prose-xl">
          <h1 class="">~title~</h1>
          ~body~
        </article>
      </div>
    </div>
    """

type GamePageInfo lock payload = { background :: String, title :: Domable lock payload, body :: Domable lock payload }

gamePage :: forall lock payload. GamePageInfo lock payload -> Domable lock payload
gamePage { background, title, body } = (Proxy :: Proxy GamePage) ~~
  { title: nut title
  , body: nut body
  , divattr: oneOf [pure (D.Class := ("min-h-screen py-8 flex flex-col justify-center relative overflow-hidden lg:py-12 bg-no-repeat bg-cover bg-center " <> background))]
  }

