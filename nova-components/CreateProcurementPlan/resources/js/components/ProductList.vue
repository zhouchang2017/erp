<template>
    <v-list>
        <v-list-item v-for="product in productList" :key="product.code">
            <v-list-item__avatar
                    src="https://img.alicdn.com/imgextra/i4/2616970884/TB2gWr5XWmgSKJjSspiXXXyJFXa_!!2616970884.jpg"></v-list-item__avatar>
            <v-list-item__content>
                <v-list-item__content-title class="text-xl">{{product.name}}
                </v-list-item__content-title>
                <v-list-item__content-title class="text-sm">{{product.name_en}}</v-list-item__content-title>
                <v-list-item__content-sub-title>
                    <v-chip>{{product.type.name}}</v-chip>
                    <v-chip>{{product.brand.name}}</v-chip>
                </v-list-item__content-sub-title>
            </v-list-item__content>
            <div slot="sub" class="ml-16" v-if="product.variants.length>0">
                <v-list-item v-for="variant in product.variants" :key="variant.sku">
                    <v-list-item__content>
                        <v-list-item__content-title class="text-sm">属性：{{variant.attribute_key}}</v-list-item__content-title>
                        <v-list-item__content-title class="text-xs">sku:{{variant.sku}}</v-list-item__content-title>
                    </v-list-item__content>

                    <v-list-item__action>
                        <div class="flex-cor">
                            <v-list-item__content-title class="text-sm">参考价：{{variant.price}}</v-list-item__content-title>
                            <div class="flex flex-row" v-if="variant.providers.length>0">
                                <div class="bg-primary rounded-full h-4 w-4 flex justify-center items-center" v-for="provider in variant.providers" :key="provider.code">
                                    <span class="text-sm text-white">{{provider.name.charAt(0)}}</span>
                                </div>
                                <!--<div class="bg-desable rounded-full h-4 w-4 flex justify-center items-center">-->
                                    <!--<span class="text-sm text-white">B</span>-->
                                <!--</div>-->
                                <!--<div class="bg-primary rounded-full h-4 w-4 flex justify-center items-center">-->
                                    <!--<span class="text-sm text-white">C</span>-->
                                <!--</div>-->
                            </div>
                        </div>

                    </v-list-item__action>

                </v-list-item>
            </div>
        </v-list-item>
    </v-list>
</template>

<script>


  import VList from './../tailwind-vue/components/VList/List'
  import VListItem from './../tailwind-vue/components/VList/ListItem'
  import VListItem__avatar from './../tailwind-vue/components/VList/ListItemAvatar'
  import VListItem__content from './../tailwind-vue/components/VList/ListItemContent'
  import VListItem__contentTitle from './../tailwind-vue/components/VList/ListItemContentTitle'
  import VListItem__contentSubTitle from './../tailwind-vue/components/VList/ListItemContentSubTitle'
  import VListItem__action from './../tailwind-vue/components/VList/ListItemAction'
  import VChip from './../tailwind-vue/components/VChip/Chip'

  export default {
    name: 'ProductList',
    components: {
      VChip,
      VListItem__action,
      VListItem__contentSubTitle,
      VListItem__contentTitle,
      VListItem__content,
      VListItem__avatar,
      VListItem,
      VList
    },
    data () {
      return {
        queryBuild: {
          include: ['brand', 'type', 'variants.providers']
        },
        productList: []
      }
    },
    methods: {
      async fetch (queryBuild = {}) {
        const {data:{data}} = await axios.get('/api/products', {params: Object.assign({}, queryBuild, this.queryBuild)})
        this.productList = data
      }
    },
    async mounted () {
      await this.fetch()
    }
  }
</script>

<style scoped>
    .ml-16 {
        margin-left: 80px;
    }
</style>