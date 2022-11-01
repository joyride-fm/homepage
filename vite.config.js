import * as path from "path";
import VitePluginInjectPreload from "vite-plugin-inject-preload";

export default {
  resolve: {
    alias: {
      PureScript: process.env.NODE_ENV === 'production'
        ? path.resolve(__dirname, "output-es/Joyride.Homepage.Main/")
        : path.resolve(__dirname, "output/Joyride.Homepage.Main/"),
    },
  },
  assetsInclude: ["**/*.glsl", "**/*.m4a"],
  build: {
    minify: !(process.env.DISABLE_MINIMIZATION === "true"),
  },
  plugins: [
    VitePluginInjectPreload({
      files: [
        {
          match: /^.+\.png/,
        },
        {
          match: /^.+\.jpg/,
        },
      ],
    }),
  ],
};
