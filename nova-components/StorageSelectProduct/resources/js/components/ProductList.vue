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
                <v-list-item v-for="variant in product.variants" :key="variant.sku" @click="openForm(product,variant)">
                    <v-list-item__content>
                        <v-list-item__content-title class="text-sm">属性：{{variant.attribute_key}}
                        </v-list-item__content-title>
                        <v-list-item__content-title class="text-xs">sku:{{variant.sku}}</v-list-item__content-title>
                    </v-list-item__content>

                    <v-list-item__action>
                        <div class="flex-cor">
                            <v-list-item__content-title class="text-sm">参考价：{{variant.price}}
                            </v-list-item__content-title>
                            <div class="flex flex-row" v-if="variant.providers.length>0">
                                <div class="rounded-full h-4 w-4 flex justify-center items-center"
                                     v-for="provider in variant.providers"
                                     :key="provider.code"
                                     :class="isActive(provider.id,variant.id)"
                                >
                                    <span class="text-sm text-white">{{provider.name.charAt(0)}}</span>
                                </div>
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
      // AddVariantForm,
      VChip,
      VListItem__action,
      VListItem__contentSubTitle,
      VListItem__contentTitle,
      VListItem__content,
      VListItem__avatar,
      VListItem,
      VList
    },
    model: {
      type: 'input',
      prop: 'value'
    },
    props: {
      value: {
        type: Array,
        default: []
      }
    },
    data () {
      return {
        queryBuild: {
          include: ['brand', 'type', 'variants.providers']
        },
        productList: [],
      }
    },
    methods: {
      async getResources (queryBuild = {}) {
        const {data: {data}} = await axios.get('/nova-vendor/storage-select-product/products', {params: Object.assign({}, queryBuild, this.queryBuild)})
        this.productList = data
      },
      openForm (product, variant) {
        if (variant.providers.length > 0) {
          Nova.$emit('open-add-variant-form', {variant: {product, ...variant}})
          return
        }
        this.$toasted.show('该产品暂无供应商，无法进行采购', {type: 'error'})
      },
      save (currentAddVariant) {
        const variantId = _.get(currentAddVariant, 'variant.id')
        const ProviderId = _.get(currentAddVariant, 'provider.id')
        if (!this.inArray(ProviderId, variantId)) {
          let value = _.cloneDeep(this.value)
          value.push(_.cloneDeep(currentAddVariant))
          this.$emit('input', value)
          this.show = false
          this.$toasted.show('添加成功', {type: 'success'})
          return
        }
        this.$toasted.show('请勿重复添加', {type: 'error'})
      },
      inArray (ProviderId, variantId) {
        return this.value.find(item => item.provider.id === ProviderId && item.variant.id === variantId)
      }
    },

    computed: {
      isActive () {
        return (providerId, variantId) => this.inArray(providerId, variantId) ? {'bg-primary': true} : {'bg-desable': true}
      }
    },
    async mounted () {
      await this.getResources()
    }
  }
</script>

<style scoped>
    .ml-16 {
        margin-left: 80px;
    }
</style>