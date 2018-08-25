<template>
    <default-field-col :field="field">
        <template slot="field">
            <textarea

                    type="text"
                    v-model="field.value"
                    class="w-full form-control form-input form-input-bordered py-3 min-h-textarea"
                    :placeholder="field.name"
            />

        </template>
    </default-field-col>
</template>

<script>
  import baseField from '../mixins/baseField'

  export default {
    name: 'Textarea',

    mixins: [baseField],

    components: {
      'default-field-col': require('./DefaultFieldCol')
    },
    data () {
      return {

      }
    },

  }
</script>

<style scoped>

</style>