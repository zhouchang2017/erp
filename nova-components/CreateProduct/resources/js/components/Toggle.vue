<template>
    <default-field-col :field="field">
        <template slot="field">
            <checkbox
                    class="py-2"
                    @input="toggle"
                    :id="field.name"
                    :name="field.name"
                    :checked="checked"
            />
        </template>
    </default-field-col>
</template>

<script>
  import baseField from '../mixins/baseField'

  export default {
    name: 'Toggle',

    mixins: [baseField],

    components: {
      'default-field-col': require('./DefaultFieldCol')
    },

    data () {
      return {

      }
    },

    methods: {
      toggle () {
        this.field.value = !this.field.value
      },
    },

    computed: {
      checked () {
        return Boolean(this.field.value)
      },

      trueValue () {
        return +this.checked
      },
    },
  }
</script>

<style scoped>

</style>