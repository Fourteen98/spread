const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    screens: {
        'sm': '640px',
        'md': '768px',
        'lg': '1024px',
        'xl': '1280px',
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
        colors: {
            'brightRed': 'hsl(12, 88%, 59%)',
            'brightRedLight': 'hsl(12, 88%, 69%)',
            'brightRedSuperLight': 'hsl(12, 88%, 95%)',
            'darkBlue': 'hsl(228, 39%, 23%)',
            'veryDarkBlue': 'hsl(223, 12%, 13%)',
            'darkGrayishBlue': 'hsl(227, 12%, 61%)',
            'veryPaleRed': 'hsl(13, 100%, 96%)',
            'veryLightGray': 'hsl(0, 0%, 98%)',
        },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
