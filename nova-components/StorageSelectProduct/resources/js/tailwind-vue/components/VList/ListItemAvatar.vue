<template>
    <v-img v-bind="$props" class="pr-4"></v-img>
</template>

<script>
  import VImg from '../VImg/Img'

  export default {
    name: 'v-list-item__avatar',
    props: {
      src: String
    },

    components: {
      'v-img': VImg
    }
  }
</script>

<style scoped>

</style>