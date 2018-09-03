export default {
  inject: {
    parentValidator: {default: null}
  },

  data: () => ({
    errorClass: 'border-danger',
  }),

  computed: {
    errorClasses () {
      return this.hasError ? [this.errorClass] : []
    },

    fieldAttribute () {
      return this.field.name || this.field.attribute
    },

    hasError () {
      return this.$validator.errors.has(this.fieldAttribute)
    },

    firstError () {
      if (this.hasError) {
        return this.$validator.errors.first(this.fieldAttribute)
      }
    },
  },

  created () {
    if (this.parentValidator) {
      this.$validator = this.parentValidator
    }
  }
}