/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx,purs}",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      fontFamily: {
        'creepster': ['Creepster', 'cursive'],
      },
    },  },
  plugins: [
    require('flowbite/plugin'),
    require('@tailwindcss/typography'),
]
}