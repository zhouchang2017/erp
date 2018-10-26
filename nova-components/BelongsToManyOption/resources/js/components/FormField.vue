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
        <sku-table v-model="skuTableSchema" :selectedOptions="selectedOptions"></sku-table>
    </div>
</template>

<script>
  import { FormField, HandlesValidationErrors } from 'laravel-nova'
  import SkuTable from './SkuTable'

  export default {
    components: {SkuTable},
    mixins: [FormField, HandlesValidationErrors],

    props: ['resourceName', 'resourceId', 'field'],

    data () {
      return {
        options: [],
        checked: [],
        skuItemAttr: new Map(),
        skuTableSchema:[]
      }
    },

    methods: {
      /*
       * Set the initial, internal value for the field.
       */
      setInitialValue () {
        this.value = this.field.value || ''
        this.options = this.field.options
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

      toggle (value) {
        if (this.isChecked(value)) {
          const index = this.checked.findIndex(item => item === value)
          this.checked.splice(index, 1)
        } else {
          this.checked.push(value)
        }
      },
      isChecked (value) {
        return !!this.checked.find(optionValue => optionValue === value)
      },

      // 通过销售所选销售属性生成变体组合
      genCartesian (elements) {
        // const formData = Object.values(_.groupBy(this.checked,'option_id'))
        if (!Array.isArray(elements)) {
          throw new TypeError()
        }

        let end = elements.length - 1,
          result = []

        function addTo (curr, start) {
          let first = elements[start],
            last = (start === end)

          for (let i = 0; i < first.length; ++i) {
            let copy = curr.slice()
            copy.push(first[i])

            if (last) {
              result.push(copy)
            } else {
              addTo(copy, start + 1)
            }
          }
        }

        if (elements.length) {
          addTo([], 0)
        } else {
          result.push([])
        }
        return result
      },

      // 获取缓存数据
      getSkuItemAttr (key) {
        return this.skuItemAttr.has(key) ? this.skuItemAttr.get(key) : false
      },

      // 设置缓存数据
      setSkuItemAttr ({key, attr}) {
        this.skuItemAttr.set(key, attr)
      },

      setSkuTableSchema(){
        const formData = Object.values(_.groupBy(this.checked, 'option_id'))
        if(formData.length <= 0){
          this.skuTableSchema = []
          return
        }
        this.skuTableSchema = this.genCartesian(formData).map(item => {
          const key = item.map(attr => attr.id).join('-')
          let cache = this.getSkuItemAttr(key)
          if (!cache) {
            cache = {sku: '', price: 0}
            this.setSkuItemAttr({key, attr: cache})
          }
          return {options: item, ...cache, key}
        })
      }
    },
    computed: {
      selectedOptions () {
        return (Array.from(new Set(this.checked.map(option => option.option_id)))).map(option_id => {
          const {id, code, name} = this.options.find(item => item.id === option_id)
          return {id, code, name}
        })
      }
    },
    watch: {
      'selectedOptions': function (val) {
        // console.log(val)
      },
      'checked': function (val) {
        this.setSkuTableSchema()
        console.log(this.skuTableSchema)
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