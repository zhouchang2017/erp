<template>
    <div class="text-xs font-semibold leading-normal pt-1" v-bind="$props">
        <slot></slot>
    </div>
</template>

<script>
  export default {
    name: 'v-list-item__content-sub-title',
    props: {},
    inheritAttrs: false
  }
</script>

<style scoped>

</style>