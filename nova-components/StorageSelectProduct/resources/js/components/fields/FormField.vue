<template>
    <default-field :field="field" :errors="errors" :full-width-content="true">
        <template slot="field">
            <!--<input :id="field.name" type="text"-->
            <!--class="w-full form-control form-input form-input-bordered"-->
            <!--:class="errorClasses"-->
            <!--:placeholder="field.name"-->
            <!--v-model="value"-->
            <!--/>-->
            <variant-table v-model="variants" @choose-product="hidden = true"></variant-table>
            <drawer v-model="hidden">
                <product-list v-model="variants"/>
            </drawer>
        </template>
    </default-field>
</template>

<script>
  import { FormField, HandlesValidationErrors } from 'laravel-nova'
  import VariantTable from '../VariantTable'
  import Drawer from '../Drawer'
  import ProductList from '../ProductList'

  export default {
    mixins: [FormField, HandlesValidationErrors],

    props: ['resourceName', 'resourceId', 'field'],

    components: {
      VariantTable,
      Drawer,
      ProductList
    },

    data () {
      return {
        hidden: false,
        variants: [],
      }
    },
    methods: {
      /*
       * Set the initial, internal value for the field.
       */
      setInitialValue () {
        this.value = this.field.value || ''
      },

      /**
       * Fill the given FormData object with the field's internal value.
       */
      fill (formData) {
        formData.append(this.field.attribute, this.value || '')
      },

      /**
       * Update the field's internal value.
       */
      handleChange (value) {
        this.value = value
      },
    },
  }
</script>
