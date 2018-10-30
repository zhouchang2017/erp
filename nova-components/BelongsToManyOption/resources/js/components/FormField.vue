<template>
    <div>
        <default-field :field="field" :errors="errors">
            <template slot="field">

            </template>
        </default-field>
        <default-field :field="option" v-for="option in options" :key="options.name" :errors="errors"
                       :fullWidthContent="true">
            <template slot="field">
                <ul class="list-reset ul-container">
                    <li class="flex items-center w-1/3" v-for="value in option.values" :key="value.id">
                        <checkbox
                                class="py-2 mr-4"
                                @input="toggle(value)"
                                :id="value.id"
                                :name="value.value"
                                :checked="isChecked(value)"
                        ></checkbox>
                        <label
                                :for="value.value"
                                v-text="value.value"
                                @click="toggle(value)"
                        ></label>
                    </li>
                </ul>

                <p v-if="hasError" class="my-2 text-danger">
                    {{ firstError }}
                </p>
            </template>
        </default-field>
        <sku-table v-model="skuTableSchema" :selectedOptions="selectedOptions" @cache-sku-item="setSkuItemAttr"></sku-table>
    </div>
</template>

<script>
  import { FormField, HandlesValidationErrors } from 'laravel-nova'
  import SkuTable from './SkuTable'
  import Helper from '../helper'
  export default {
    components: {SkuTable},
    mixins: [FormField, HandlesValidationErrors,Helper],

    props: ['resourceName', 'resourceId', 'field'],

    data () {
      return {
        options: [],
        checked: [],
        skuItemAttr: new Map(),
        skuTableSchema: []
      }
    },

    methods: {
      /*
       * Set the initial, internal value for the field.
       */
      setInitialValue () {
        this.value = this.field.value || ''
        this.pageInit()
      },

      /**
       * Fill the given FormData object with the field's internal value.
       */
      fill (formData) {
        const value = JSON.stringify(this.skuTableSchema)
        formData.append(this.field.attribute, value)
      },


      /**
       * Update the field's internal value.
       */
      handleChange (value) {
        this.value = value
      },

      toggle (value) {
        if (this.isChecked(value)) {
          const index = this.checked.findIndex(item => item.id === value.id)
          this.checked.splice(index, 1)
        } else {
          this.checked.push(value)
        }
      },
      isChecked (value) {
        return !!this.checked.find(optionValue => optionValue.id === value.id)
      },
    }
  }
</script>

<style scoped>
    .ul-container {
        display: flex;
        flex-wrap: wrap;
    }
</style>