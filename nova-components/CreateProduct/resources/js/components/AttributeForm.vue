<template>
    <div>
        <template v-for="item in groups">
            <text-field :field="item" :key="item.id" v-if="item.type==='text'"></text-field>
            <check-box-group-field :field="item" :key="item.id"
                                   v-if="item.type==='checkbox_group'"></check-box-group-field>
            <radio-group-field :field="item" :key="item.id" v-if="item.type==='radio_group'"></radio-group-field>
            <select-field :field="item" :key="item.id" v-if="item.type==='select'"></select-field>
            <textarea-field :field="item" :key="item.id" v-if="item.type==='textarea'"></textarea-field>
            <toggle-field :field="item" :key="item.id" v-if="item.type==='toggle'"></toggle-field>
        </template>
        <!--sku table-->
        <sku-table @cache-sku-item="setSkuItemAttr" v-show="skuTableSchema.length>0"
                   v-model="skuTableSchema"></sku-table>
    </div>
</template>

<script>
  export default {
    name: 'AttributeForm',

    props: ['resourceName', 'resourceId', 'field', 'value'],

    model: {
      prop: 'value',
      event: 'input'
    },

    components: {
      'text-field': require('./Text'),
      'check-box-group-field': require('./CheckBoxGroup'),
      'radio-group-field': require('./RadioGroup'),
      'select-field': require('./Select'),
      'textarea-field': require('./Textarea'),
      'toggle-field': require('./Toggle'),
      'sku-table': require('./SkuTable')
    },

    data () {
      return {
        productType: null,
        id: this.field.typeId,
        groups: [],
        loaded: false,
        cacheProductTypeOption: new Map(),
        skuTableSchema: [],
        // 表格数据储存容器
        skuItemAttr: new Map()
      }
    },

    methods: {
      async fetchProductType (id) {
        try {
          const res = await axios.get(`/api/product-types/${id}`)
          this.productType = res.data
          const groups = res.data.attribute_groups
          this.groups = groups ? this.addValueField(groups.sort((a, b) => +a.variant - +b.variant)) : []
        } catch (e) {

        }

      },
      addValueField (groups) {
        return groups.map(group => {
          let value
          if (this.isComment(group)) {
            value = ''
          } else if (group.type === 'toggle') {
            value = false
          } else if (group.type === 'radio_group') {
            value = []
          } else {
            value = []
          }
          return Object.assign({}, group, {value})
        })
      },
      fill () {
        const origin = this.field.origin
        if (origin && origin.attributes.length > 0) {
          const attributes = origin.attributes.reduce((res, item) => {
            if (!res[item.attribute_group_id]) {
              res[item.attribute_group_id] = []
            }
            let value = item.comment || item.attribute_value
            if (item.group.type === 'toggle') value = !!+value
            res[item.attribute_group_id].push({id: item.id, value})
            return res
          }, {})
          // 属性☑️
          this.groups = this.groups.map(group => {
            if (attributes[group.id]) {
              group.origin = attributes[group.id]
              if (['text', 'textarea', 'toggle', 'radio_group', 'select'].includes(group.type)) {
                group.value = group.origin[0].value
              } else if (group.type === 'checkbox_group') {
                group.value = group.origin.map(item => item.value)
              }
            }
            return group
          })
          // sku表格数据填充
          const variants = origin.variants
          if (variants.length > 0) {
            variants.forEach(variant => {
              const {attribute_key: key, price, sku, id} = variant
              key && this.setSkuItemAttr({key, attr: {price, sku, id}})
            })
          }
        }
      },

      isComment (item) {
        return item.type === 'text' || item.type === 'textarea'
      },

      // 设置缓存
      setCache (key, payload) {
        this.cacheProductTypeOption.set(key, payload)
      },

      // 获取缓存
      getCache (key) {
        return this.cacheProductTypeOption.has(key) ? this.cacheProductTypeOption.get(key) : false
      },

      // 通过销售所选销售属性生成变体组合
      genCartesian () {
        const flatten = arr => [].concat.apply([], arr)
        const formData = this.groups.filter(group => group.variant)
        if (formData.length === 0 || formData.some(item => item.value.length === 0)) return []
        // [...element, {group_name: attr.item.name, group_id: attr.item.id, value_id: value.id, value_name: value.value}]
        return formData.reduce((acc, set) =>
          flatten(acc.map(x => set.value.map(y => [...x,
            {group_name: set.name, group_id: set.id, value_id: y.id, value_name: y.value}
          ]))), [[]])
      },

      // 获取缓存数据
      getSkuItemAttr (key) {
        return this.skuItemAttr.has(key) ? this.skuItemAttr.get(key) : false
      },

      // 设置缓存数据
      setSkuItemAttr ({key, attr}) {
        this.skuItemAttr.set(key, attr)
      },

      findOriginId (group) {
        const {attribute_group_id, attribute_id} = group
        const attributes = this.origin.attributes
        return (attributes.find(item => item.attribute_group_id === attribute_group_id && item.attribute_id === attribute_id)).id
      },

      appendId (group, value = null) {
        if (group.origin) {
          if (value) {
            const productType = group.origin.find(attr => attr.value.id === value.id && attr.value.group_id === value.group_id)
            return productType ? {id: productType.id} : {}
          }
          return group.origin[0] ? {id: group.origin[0].id} : {}
        }
        return {}
      }
    },

    computed: {
      attributes () {
        return this.groups.length > 0 ? this.groups.reduce((res, group) => {
          const attributeGroupId = group.id

          if (['text', 'textarea', 'toggle'].includes(group.type)) {
            res.push({attribute_group_id: attributeGroupId, comment: group.value, ...this.appendId(group)})
          } else if (group.type === 'radio_group' || group.type === 'select') {
            res.push({attribute_group_id: attributeGroupId, attribute_id: group.value.id, ...this.appendId(group)})
          } else if (group.type === 'checkbox_group') {
            group.value.forEach(item => {
              res.push({attribute_group_id: attributeGroupId, attribute_id: item.id, ...this.appendId(group, item)})
            })
          }
          return res
        }, []) : []
      },

      variants () {
        const sku = this.skuTableSchema
        return sku.map(item => {
          let {price, attributes, sku, key, id} = item

          attributes = attributes.map(attr => attr.value_id)

          let append = id ? {id} : {}

          return Object.assign({}, {price, sku, attributes, attribute_key: key}, append)
        })
      }
    },

    watch: {
      attributes: {
        handler: function (attributes) {
          this.$emit('input', attributes)
          this.setCache(String(this.id), {
            value: attributes,
            productType: this.productType,
            groups: this.groups,
            skuItemAttr: this.skuItemAttr
          })
        },
        immediate: true
      },
      groups: {
        handler: function () {
          const schema = this.genCartesian()
          this.skuTableSchema = schema.map(item => {
            const key = item.map(attr => attr.value_name).join('-')
            let cache = this.getSkuItemAttr(key)
            if (!cache) {
              cache = {sku: '', price: 0}
              this.setSkuItemAttr({key, attr: cache})
            }
            return {attributes: item, ...cache, key}
          })
        },
        deep: true
      }
    },

    async mounted () {
      await this.fetchProductType(this.id)
      this.loaded = true
      this.fill()
    }
  }
</script>
