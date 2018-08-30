<script>
  import Measurable from '../../mixins/measurable'

  export default {
    name: 'v-responsive',

    mixins: [Measurable],

    props: {
      aspectRatio: [String, Number]
    },

    computed: {
      computedAspectRatio () {
        return Number(this.aspectRatio)
      },
      aspectStyle () {
        return this.computedAspectRatio
          ? { paddingBottom: (1 / this.computedAspectRatio) * 100 + '%' }
          : undefined
      },
      __cachedSizer () {
        if (!this.aspectStyle) return []

        return this.$createElement('div', {
          style: this.aspectStyle,
        })
      }
    },
  }
</script>