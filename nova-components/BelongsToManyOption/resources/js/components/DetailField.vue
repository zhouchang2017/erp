<template>
    <div>
        <panel-item v-for="(option,index) in value" :key="option.code" :field="option" :style="{borderBottomWidth: index ===value.length-1 ? '0':'1px'}">
            <div slot="value">
                <template v-for="optionValue in option.values">
                    <p class="text-90" v-if="optionValue.value"
                    >{{ optionValue.value }}</p>
                    <p v-else>-</p>
                </template>
                <p v-if="option.values.length === 0">-</p>
            </div>
        </panel-item>
        <sku-table class="mt-4" v-model="skuTableSchema" :detail="true" :selectedOptions="selectedOptions" @cache-sku-item="setSkuItemAttr"></sku-table>
    </div>
</template>

<script>
  import Helper from '../helper'
  import SkuTable from './SkuTable'
  export default {
    props: ['resource', 'resourceName', 'resourceId', 'field'],

    mixins: [Helper],

    components:{
      SkuTable
    },

    data(){
      return {
        value:[]
      }
    },

    methods:{
      handle(){
        const checkedIds = this.checked.map(item=>item.id)
        this.value = this.field.value.map(option=>{
          option.values = option.values.filter(value=>checkedIds.includes(value.id))
          return option
        })
      }
    },

    mounted () {
      this.pageInit()
      this.handle()
    }
  }
</script>
