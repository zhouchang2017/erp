<template>
    <default-field :field="field">
        <template slot="field">
            <textarea
                    type="text"
                    v-model="value"
                    class="w-full form-control form-input form-input-bordered py-3 min-h-textarea"
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
    mixins: [FormField, HandleValidationField],

    props: {
      resourceName: {},
      field: {},
    }
  }
</script>
