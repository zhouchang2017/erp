function isCssColor (color) {
  return !!color && !!color.match(/^(#|(rgb|hsl)a?\()/)
}

export default {
  name: 'colorable',

  props: {
    color: String
  },

  methods: {
    setBackgroundColor (color, data) {
      if (isCssColor(color)) {
        data.style = {
          ...data.style,
          'background-color': `${color}`,
          'border-color': `${color}`
        }
      } else if (color) {
        data.class = {
          ...data.class,
          ['bg-' + color]: true
        }
      }

      return data
    },

    setTextColor (color, data) {
      if (isCssColor(color)) {
        data.style = {
          ...data.style,
          'color': `${color}`,
          'caret-color': `${color}`
        }
      } else if (color) {
        const colorName = color.toString().trim()
        data.class = {
          ...data.class,
          ['text-' + colorName]: true
        }
      }
      return data
    },

    setBorderColor (color, data) {
      if (isCssColor(color)) {
        data.style = {
          ...data.style,
          'border-color': `${color}`,
        }
      } else if (color) {
        const colorName = color.toString().trim()
        data.class = {
          ...data.class,
          ['border-' + colorName]: true
        }
      }
      return data
    }
  }
}