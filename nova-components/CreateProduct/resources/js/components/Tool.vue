<template>
    <div>
        Create Product
    </div>
</template>

<script>
    export default {
        props: ['resourceName', 'resourceId', 'field'],

        mounted() {
            console.log('create product mounted!!')
            console.log(this.resourceName)
        }
    }
</script>
