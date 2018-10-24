<template>
    <div class="list-item flex flex-col">
        <div class="flex flex-row px-6 py-4 w-full items-center hover:bg-30"
             :class="{'cursor-pointer':showCursorPointer}"
             @click.stop="show">
            <slot></slot>
            <div v-if="!!$slots.sub" @click.stop="hidden = !hidden"
                 class="flex items-center justify-center cursor-pointer">
                ️{{hidden ? '⬆️' :'⬇️'}}
            </div>
        </div>
        <div v-show="hidden">
            <slot name="sub"></slot>
        </div>

    </div>
</template>

<script>
  export default {
    name: 'v-list-item',
    data () {
      return {
        hidden: false
      }
    },
    methods: {
      show () {
        if (!!this.$slots.sub) {
          this.hidden = !this.hidden
        } else {
          this.$emit('click')
        }
      }
    },
    computed: {
      showCursorPointer () {
        return !!this.$slots.sub || _.has(this.$listeners, 'click')
      }
    }
  }
</script>

<style scoped>
    .list-item {
        border-bottom: 1px solid #e9e9e9;
    }

    .list-item:last-child {
        border-bottom: none;
    }
</style>