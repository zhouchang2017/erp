<template>
    <div class="list">
        <v-list-item/>
    </div>
</template>

<script>
  export default {
    name: 'List',
    components: {
      'v-list-item': require('./ListItem')
    }
  }
</script>

<style scoped>

</style>