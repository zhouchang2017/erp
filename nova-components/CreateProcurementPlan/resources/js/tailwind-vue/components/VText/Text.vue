<template>
    <default-field :field="field">
        <template slot="field">
            <input
                    :id="field.name"
                    :type="inputType"
                    :min="inputMin"
                    :max="inputMax"
                    :step="inputStep"
                    v-model="value"
                    v-validate="field.rule"
                    :name="field.name || field.attribute"
                    class="w-full form-control form-input form-input-bordered"
                    :class="errorClasses"
                    :placeholder="field.name"
                    @input="()=>$emit('input',value)"
            />

            <p v-if="hasError" class="my-2 text-danger">
                {{ firstError }}
            </p>
        </template>
    </default-field>
</template>

<script>
  import HandleValidationField from '../../mixins/handleValidationField'
  import FormField from '../../mixins/formField'

  export default {
    name: 'v-text',
    mixins: [FormField, HandleValidationField],

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
