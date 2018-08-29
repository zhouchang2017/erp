<template>
    <div>
    <transition name="slide-fade">
            <div v-show="value" class="bg-white z-500 fixed mx-auto h-screen w-1/2 pin-r pin-b h-8  shadow-md">
                <div class="container mx-auto h-full px-2 py-2 flex">
                    <div class="w-full">
                        <slot></slot>
                    </div>
                </div>
            </div>
    </transition>
    <div v-show="value" class="bg-90 opacity-25 fixed h-screen pin-b pin-x w-full z-499" @click="$emit('input',false)"></div>
    </div>
</template>

<script>
  export default {
    name: 'Drawer',
    model: {
      event: 'input',
      prop: 'value'
    },
    props: {
      value: {
        type: Boolean,
        default: false
      }
    }
  }
</script>

<style scoped>
    .slide-fade-enter-active {
        transition: all .3s ease;
    }

    .slide-fade-leave-active {
        transition: all .3s cubic-bezier(1.0, 0.5, 0.8, 1.0);
    }

    .slide-fade-enter, .slide-fade-leave-to
        /* .slide-fade-leave-active for below version 2.1.8 */
    {
        transform: translateX(10px);
        opacity: 0;
    }

    .z-499 {
        z-index: 499;
    }

    .z-500 {
        z-index: 500;
    }
</style>