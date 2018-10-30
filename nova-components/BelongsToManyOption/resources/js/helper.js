export default {
  data () {
    return {
      options: [],
      checked: [],
      skuItemAttr: new Map(),
      skuTableSchema: []
    }
  },
  methods: {
    pageInit () {
      this.options = this.field.options
      this.fillChecked(this.field.origin)
    },
    fillChecked (product) {
      const variants = _.get(product, 'variants')
      let checked = []
      if (variants) {
        variants.forEach(variant => {

          const optionValues = _.get(variant, 'option_values', [])
          const key = optionValues.map(attr => {
            if (!checked.find(item => item.id === attr.id)) {
              checked.push(attr)
            }
            return attr.id
          }).join('-')
          const attr = {
            id: _.get(variant, 'id', null),
            code: variant.code,
            price: _.get(variant, 'price.price', '0.00'),
            height: _.get(variant, 'height', 0),
            length: _.get(variant, 'length', 0),
            width: _.get(variant, 'width', 0),
            weight: _.get(variant, 'weight', 0),
          }
          this.setSkuItemAttr({key, attr})
        })
      }
      this.checked = checked
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

    setSkuTableSchema () {
      const formData = Object.values(_.groupBy(this.checked, 'option_id'))
      if (formData.length <= 0) {
        this.skuTableSchema = []
        return
      }
      this.skuTableSchema = this.genCartesian(formData).map(item => {
        const key = item.map(attr => attr.id).join('-')
        let cache = this.getSkuItemAttr(key)
        if (!cache) {
          cache = {
            id: null,
            code: '',
            price: '0.00',
            height: 0,
            length: 0,
            width: 0,
            weight: 0,
          }
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
    'checked': function (val) {
      this.setSkuTableSchema()
    }
  }
}