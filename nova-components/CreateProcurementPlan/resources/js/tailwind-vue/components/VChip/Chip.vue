<script>
  import colorable from '../../mixins/colorable'

  export default {
    name: 'v-chip',

    mixins: [colorable],

    props: {
      outline: Boolean,
      pill: Boolean,
      active: Boolean,
      small: Boolean,
      textColor: {
        type: String,
        default: 'white'
      },
      color: {
        type: String,
        default: 'primary'
      }
    },

    data () {
      return {
        defaultClass: {
          'text-sm': true,
          'rounded': true,
          'px-2': true
        }
      }
    },

    computed: {
      classes () {
        return {
          'border': this.outline,
          'text-xs': this.small,
          'rounded-full': this.pill,
          ...this.defaultClass
        }
      }
    },

    render (h) {
      const color = this.outline ? 'transparent' : this.color
      const data = this.setBackgroundColor(color, {
        'class': this.classes,
        on: this.$listeners
      })
      const textColor = this.outline ? this.color : this.textColor
      return h('span', this.setTextColor(textColor, data), this.$slots.default)
    }

  }
</script>

<style scoped>

</style>