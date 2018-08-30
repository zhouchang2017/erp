function isClassSize (size) {
  return !!size && !!size.match(/^h-[1-9]\d*$/)
}

export default {
  name: 'sizeable',

  props: {
    height: [Number, String],
    width: [Number, String],
  },

  methods: {
    setElementSize (size, pos, data) {
      if (isClassSize(size)) {
        data.class = {
          ...data.class,
          [size]: true
        }
      } else if (size) {

        data.style = {
          ...data.style,
          [pos]: `${size}`,
        }
      }

      return data
    },

  }
}