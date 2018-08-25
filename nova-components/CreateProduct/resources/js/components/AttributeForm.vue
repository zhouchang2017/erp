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
        <sku-table @cache-sku-item="setSkuItemAttr" v-show="skuTableSchema.length>0" v-model="skuTableSchema"></sku-table>
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
      'sku-table':require('./SkuTable')
    },

    data () {
      return {
        productType: null,
        id: null,
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
      }
    },

    computed: {
      attributes () {
        const paserValue = value => _.isString(value) || _.isBoolean(value) ? {comment: value} : {attribute_id: ([].concat.apply([], [value])).map(attr => attr.id)}
        return this.groups.map(item => (
          {
            'attribute_group_id': item.id,
            ...paserValue(item.value)
          }
        ))
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
      'attributes': function (attributes) {
        this.$emit('input', attributes)
        this.setCache(String(this.id), {
          value: attributes,
          productType: this.productType,
          groups: this.groups,
          skuItemAttr: this.skuItemAttr
        })
      },
      groups: {
        handler: function (val) {
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
      this.id = this.field.typeId
      await this.fetchProductType(this.id)
      this.loaded = true
    }
  }
</script>
