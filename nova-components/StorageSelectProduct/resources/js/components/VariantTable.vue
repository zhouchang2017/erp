<template>
    <div class="overflow-x-auto">
        <div class="text-center" v-if="value.length <= 0">
            <svg xmlns="http://www.w3.org/2000/svg" width="65" height="51" viewBox="0 0 65 51" class="mb-3">
                <g id="Page-1" fill="none" fill-rule="evenodd">
                    <g id="05-blank-state" fill="#A8B9C5" fill-rule="nonzero" transform="translate(-779 -695)">
                        <path id="Combined-Shape"
                              d="M835 735h2c.552285 0 1 .447715 1 1s-.447715 1-1 1h-2v2c0 .552285-.447715 1-1 1s-1-.447715-1-1v-2h-2c-.552285 0-1-.447715-1-1s.447715-1 1-1h2v-2c0-.552285.447715-1 1-1s1 .447715 1 1v2zm-5.364125-8H817v8h7.049375c.350333-3.528515 2.534789-6.517471 5.5865-8zm-5.5865 10H785c-3.313708 0-6-2.686292-6-6v-30c0-3.313708 2.686292-6 6-6h44c3.313708 0 6 2.686292 6 6v25.049375c5.053323.501725 9 4.765277 9 9.950625 0 5.522847-4.477153 10-10 10-5.185348 0-9.4489-3.946677-9.950625-9zM799 725h16v-8h-16v8zm0 2v8h16v-8h-16zm34-2v-8h-16v8h16zm-52 0h16v-8h-16v8zm0 2v4c0 2.209139 1.790861 4 4 4h12v-8h-16zm18-12h16v-8h-16v8zm34 0v-8h-16v8h16zm-52 0h16v-8h-16v8zm52-10v-4c0-2.209139-1.790861-4-4-4h-44c-2.209139 0-4 1.790861-4 4v4h52zm1 39c4.418278 0 8-3.581722 8-8s-3.581722-8-8-8-8 3.581722-8 8 3.581722 8 8 8z"></path>
                    </g>
                </g>
            </svg>
            <h3 class="text-base text-80 font-normal mb-6">
                暂无选择任何产品。
            </h3>
            <span class="ml-auto">
                <button class="btn btn-sm btn-outline" @click.prevent="$emit('choose-product')">
                    {{__('Choose Product')}}
                 </button>
            </span>
        </div>
        <table
                v-else
                class="table  w-full"
                cellpadding="0"
                cellspacing="0">
            <thead>
            <th class="text-left" v-for="header in headers" :key="header.text">{{header.text}}</th>
            <th></th>
            </thead>
            <tbody>
            <tr v-for="(item,index) in value" :key="genKey(item)">
                <td v-for="header in headers" :key="header.text">
                    <span class="whitespace-no-wrap text-left">{{getColValue(item,header.value)}}</span>
                </td>

                <td class="td-fit text-right pr-6">

                    <!-- Edit Pivot Button -->
                    <button
                            class="cursor-pointer text-70 hover:text-primary mr-3"
                            :title="__('Edit')"
                            @click.prevent="openForm(item,index)"
                    >
                        <icon type="edit"/>
                    </button>
                    <!-- Delete Resource Link -->
                    <button
                            class="appearance-none cursor-pointer text-70 hover:text-primary mr-3"
                            :title="__('Delete')"
                            @click.prevent="delItem(item,index)"
                    >
                        <icon/>
                    </button>

                </td>

            </tr>
            </tbody>
        </table>
    </div>

</template>

<script>
  export default {
    name: 'v-variant-table',

    model: {
      prop: 'value',
      event: 'input'
    },

    props: {
      value: {type: Array, default: () => []}
    },

    data () {
      return {
        headers: [
          {text: '商品名称', value: 'variant.product.name'},
          {text: '销售属性', value: 'variant.attribute_key'},
          {text: '建议售价', value: 'price'},
          {text: '供应商', value: 'provider.name'},
          {text: '采购价', value: 'offer_price'},
          {text: '采购数量', value: 'pcs'},
          // {text: '小计金额', value: 'pcs'}
        ]
      }
    },

    methods: {
      openForm (variant, index) {
        Nova.$emit('open-add-variant-form', {variant, edit: true, index})
      },
      delItem (variant, index) {
        let products = _.cloneDeep(this.value)
        products.splice(index, 1)
        this.$emit('input', products)
        const name = variant.variant.product.name + ' ' + variant.variant.attribute_key
        this.$toasted.show(name + ' 以移除', {type: 'success'})
      },
      getColValue (item, key) {
        return _.get(item, key)
      },
      genKey (item) {
        return `variant-id:${_.get(item, 'variant.id')}|provider-id:${_.get(item, 'provider.id')}`
      }
    }
  }
</script>

<style scoped>

</style>