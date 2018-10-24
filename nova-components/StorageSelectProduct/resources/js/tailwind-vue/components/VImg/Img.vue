<script>
  import Sizeable from '../../mixins/sizeable'
  import Colorable from '../../mixins/colorable'

  export default {
    name: 'v-img',
    mixins: [Sizeable, Colorable],
    props: {
      alt: String,
      src: {
        type: [String, Object],
        default: ''
      },
      list: Boolean,
      roundedFull: Boolean,
      lazySrc: String,
      height: {
        type: [String, Number],
        default: 'h-16'
      }
    },

    computed: {
      classes () {
        return {
          'rounded-full': this.roundedFull
        }
      }
    },

    methods: {},

    render (h) {

      const alt = this.alt ? {alt: this.alt} : {}
      const attrs = Object.assign({}, {src: this.src}, alt)
      const data = this.setElementSize(this.height, 'height', {
        'class': this.classes,
        staticClass: 'block',
        attrs,
        on: this.$listeners
      })
      return h('img', this.setElementSize(this.width, 'width', data))
    }
  }
</script>

<style scoped>

</style>