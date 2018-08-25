<template>
    <default-field-col :field="field">
        <template slot="field">
            <input
                    :id="field.name"
                    :type="inputType"
                    v-model="field.value"
                    class="w-full form-control form-input form-input-bordered"
                    :class="errorClasses"
                    :placeholder="field.name"
            />

        </template>
    </default-field-col>
</template>

<script>
  import baseField from '../mixins/baseField'

  export default {
    name: 'Text',
    mixins: [baseField],
    components: {
      'default-field-col': require('./DefaultFieldCol')
    },
    data () {
      return {

      }
    },

    computed: {
      /**
       * Get the input type.
       */
      inputType () {
        return this.field.type || 'text'
      },

      /**
       * Get the input step amount.
       */
      inputStep () {
        return this.field.step
      },

      /**
       * Get the input minimum amount.
       */
      inputMin () {
        return this.field.min
      },

      /**
       * Get the input maximum amount.
       */
      inputMax () {
        return this.field.max
      },

      /**
       * Get the pattern that should be used for the field
       */
      inputPattern () {
        return this.field.pattern
      },
    },
  }
</script>

<style scoped>

</style>