module.exports = {
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true
  },
  purge: {
    content: [
      './**/*.html.slim',
      '../views/**/*.html.slim'
    ]
  },
  theme: {
    extend: {
      fontFamily: {
        body: ['Roboto', 'sans-serif']
      },
      colors: {
        secondary: '#bef6e9',
        primary: '#1538cf'
      }
    }
  },
  variants: {},
  plugins: []
}
