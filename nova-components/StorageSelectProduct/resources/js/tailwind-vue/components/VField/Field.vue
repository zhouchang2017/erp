<template>
    <field-wrapper>
        <div class="w-1/5 py-6">
            <slot>
                <form-label :for="field.name">
                    {{ field.name || fieldName }}
                </form-label>

                <help-text :show-help-text="showHelpText">
                    {{ field.helpText }}
                </help-text>
            </slot>
        </div>
        <div class="w-full px-8 py-6">
            <slot name="field"/>
        </div>
    </field-wrapper>
</template>

<script>
  export default {
    name: 'v-field',
    props: {
      field: {type: Object, required: true},
      fieldName: {type: String},
      showHelpText: {type: Boolean, default: true},
    },
  }
</script>
