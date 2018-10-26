<template>
    <div>
        <default-field :field="field" :errors="errors" :fullWidthContent="true">
            <template slot="field">
                <ul class="list-reset ul-container">
                    <li class="flex items-center w-1/3" v-for="attribute in attributes" :key="attribute.name">
                        <checkbox
                                class="py-2 mr-4"
                                @input="toggle(attribute)"
                                :id="attribute.name"
                                :name="attribute.name"
                                :checked="attribute.checked"
                        ></checkbox>
                        <label
                                :for="field.name"
                                v-text="attribute.name"
                                @click="toggle(attribute)"
                        ></label>
                    </li>
                </ul>

                <p v-if="hasError" class="my-2 text-danger">
                    {{ firstError }}
                </p>
            </template>
        </default-field>
        <translation-form-field v-for="attribute in checkedAttribute" :key="attribute.name" :field="attribute">
        </translation-form-field>
    </div>
</template>

<script>
  import { FormField, HandlesValidationErrors } from 'laravel-nova'
  import TranslationFormField from './TranslationFormField'

  export default {
    mixins: [FormField, HandlesValidationErrors],

    props: ['resourceName', 'resourceId', 'field'],
    components: {
      TranslationFormField
    },
    data () {
      return {
        attributes: []
      }
    },

    methods: {
      /*
       * Set the initial, internal value for the field.
       */
      setInitialValue () {
        this.value = this.field.value || ''
        this.attributes = this.field.attributes.map(attribute => {
          // const isChecked = this.value.find(related => related.id === attribute.id)
          const isChecked = _.get(this.value, attribute.id, null)
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
      },

      /**
       * Fill the given FormData object with the field's internal value.
       */
      fill (formData) {
        // formData.append(this.field.attribute, this.checkedAttribute || '')
        this.objectToFormData(this.checkedAttribute || '', formData, this.field.attribute)
      },

      /**
       * Update the field's internal value.
       */
      handleChange (value) {
        this.value = value
      },

      toggle (attribute) {
        attribute.checked = !attribute.checked
      },

      objectToFormData (obj, form, namespace) {
        let fd = form || new FormData()
        let formKey

        for (let property in obj) {
          if (obj.hasOwnProperty(property) && obj[property]) {
            if (namespace) {
              formKey = namespace + '[' + property + ']'
            } else {
              formKey = property
            }

            // if the property is an object, but not a File, use recursivity.
            if (obj[property] instanceof Date) {
              fd.append(formKey, obj[property].toISOString())
            }
            else if (typeof obj[property] === 'object' && !(obj[property] instanceof File)) {
              this.objectToFormData(obj[property], fd, formKey)
            } else { // if it's a string or a File object
              fd.append(formKey, obj[property])
            }
          }
        }

        return fd
      }
    },
    computed: {
      checkedAttribute () {
        return this.attributes.filter(attr => attr.checked)
      }
    }
  }
</script>

<style scoped>
    .ul-container {
        display: flex;
        flex-wrap: wrap;
    }
</style>
