<template>
    <table
            class="table  w-full"
            cellpadding="0"
            cellspacing="0">
        <thead>
            <th class="text-left" v-for="header in headers" :key="header.text">{{header.text}}</th>
        </thead>
        <tbody>
        <tr v-for="(item,index) in value" :key="value.key">
            <td v-for="(attr,ind) in item.attributes" :key="ind"><span class="whitespace-no-wrap text-left">{{attr.value_name}}</span></td>
            <td><span class="whitespace-no-wrap text-left">
                <input class="w-full form-control form-input form-input-bordered"
                       id="sku"
                       name="sku"
                       type="text"
                       :value="item.sku"
                       @input="onInputChange($event.target.value,item,index,'sku')"
                       placeholder="请输入变体sku"
                >
            </span></td>
            <td><span class="whitespace-no-wrap text-left">
                <input class="w-full form-control form-input form-input-bordered"
                       id="price"
                       name="price"
                       type="text"
                       :value="item.price"
                       @input="onInputChange($event.target.value,item,index,'price')"
                       placeholder="请输入变体参考价格"
                >
            </span></td>
        </tr>
        </tbody>
    </table>
</template>

<script>
  export default {
    name: 'SkuTable',

    model: {
      prop: 'value',
      event: 'input'
    },

    props: {
      value: {type: Array, default: () => []}
    },

    methods:{
      onInputChange (value, item, index, field) {
        if (field==='price') { value = +value }
        const val = _.cloneDeep(this.value)
        val[index][field] = value
        this.$emit('input', val)
        this.$emit('cache-sku-item', {key: item.key, attr: val[index]})
      }
    },

    computed: {
      headers () {
        let col = _.head(this.value)
        if (col) {
          return [...col.attributes.map(item => ({text: item.group_name, value: 'value_name'})),
            {text: 'SKU码', value: 'sku'},
            {text: '价格', value: 'price'}
          ]
        }
        return []
      }
    }
  }
</script>

<style scoped>

</style>