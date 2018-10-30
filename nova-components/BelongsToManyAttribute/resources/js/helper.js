export default {
  data () {
    return {
      attributes: []
    }
  },
  methods:{
    setAttributes(){
      this.attributes = this.field.attributes.map(attribute => {
        // const isChecked = this.value.find(related => related.id === attribute.id)
        const isChecked = _.get(this.field.value, attribute.id, null)
        const value = Object.keys(this.field.locales).reduce((res, locale) => {
          res[locale] = _.get(isChecked, `${locale}.text_value`, null)
          return res
        }, {})
        const {locales, indexLocale, singleLine} = this.field
        return {
          'name': attribute.name,
          'origin': attribute,
          'related': isChecked || null,
          'value': value,
          'checked': !!isChecked,
          locales, indexLocale, singleLine
        }
      })
    }
  },
  computed: {
    checkedAttribute () {
      return this.attributes.filter(attr => attr.checked)
    }
  }
}