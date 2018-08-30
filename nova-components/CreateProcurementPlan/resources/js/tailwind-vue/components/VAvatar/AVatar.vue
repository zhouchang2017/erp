<template>

</template>

<script>
  import colorable from '../../mixins/colorable'
  import sizeable from '../../mixins/sizeable'

  export default {
    name: 'v-avatar',
    functional: true,
    props: {
      // TODO: inherit these
      color: String,

      size: {
        type: [Number, String],
        default: 48
      },
      tile: Boolean
    },
    mixins: [colorable, sizeable],

    render (h, {data, props, children}) {

    }
  }
</script>

<style scoped>

</style>