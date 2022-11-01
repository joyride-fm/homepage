module Joyride.Homepage.Main where

import Prelude

import Deku.Core (Nut)
import Deku.Pursx ((~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

type Index = """<div
      class="min-h-screen bg-gray-50 py-8 flex flex-col justify-center relative overflow-hidden lg:py-12"
    >
      <div
        class="relative w-full px-6 py-12 bg-white shadow-xl shadow-slate-700/10 ring-1 ring-gray-900/5 md:max-w-3xl md:mx-auto lg:max-w-4xl lg:pt-16 lg:pb-28"
      >
        <article class="prose lg:prose-xl">
          <h1 class="">Hi 👋</h1>
          <p class="">
            We're <b>joyride.fm</b>. We're a small game studio with roots in
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
        </article>
      </div>
    </div>"""

indexPage :: Nut
indexPage = (Proxy :: Proxy Index) ~~ {}

main :: Effect Unit
main = runInBody indexPage