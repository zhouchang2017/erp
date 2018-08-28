<template>

    <card id="productModal" class="bg-10 flex flex-col items-center justify-center" style="min-height: 300px">
        <h1>dafdsf</h1>
        <input type="text" name="" id="">
    </card>

</template>

<script>
  export default {
    name: 'ProductModal',

    model: {
      prop: 'hidden',
      event: 'close'
    },

    props: {
      hidden: Boolean,
      default: false
    },

    methods: {
      handleClose () {
        this.$emit('close', false)
      },
    }
  }
</script>

<style scoped>

</style>