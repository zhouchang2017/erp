<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">Create ProcurementPlan</h4>
            <div class="ml-auto flex">
                <button class="btn btn-default btn-primary" @click="hidden = true">choose product</button>
            </div>
        </div>

        <card class="mb-6 py-3 px-6">
            <!--<v-select-warehouse v-model="warehouseId"></v-select-warehouse>-->

            <component
                    :key="field.name"
                    class="v-default-field"
                    v-for="field in fields"
                    :is="field.component"
                    :field="field"
                    v-model="field.value"
            />

        </card>

        <card class="bg-10 mb-6 flex flex-col overflow-hidden" :class="{'justify-center':variants.length<=0}"
              :style="styles">
            <v-variant-table v-model="variants" @choose-product="hidden = true"></v-variant-table>
            <div class="bg-30 flex px-8 py-4" v-if="variants.length>0">
                <select v-model="status" class="form-control form-select ml-auto mr-3">
                    <option value="uncommitted">保存</option>
                    <option value="pending" selected>提交审核</option>
                </select>
                <button class="btn btn-default btn-primary" @click="store">
                    Create Procurement Plan
                </button>
            </div>
        </card>


        <v-drawer v-model="hidden">
            <v-search/>
            <v-product-list v-model="variants"/>
        </v-drawer>
        <add-variant-form
                @procurement-plan-save-variant="save"
        ></add-variant-form>
    </div>
</template>

<script>

  import AddVariantForm from './AddVariantForm'
  import VDrawer from '../tailwind-vue/components/VDrawer/Drawer'
  import VVariantTable from './VariantTable'
  import VField from '../tailwind-vue/components/VField/Field'
  import VSelectWarehouse from './SelectWarehouses'

  import HandleValidationForm from '../tailwind-vue/mixins/handleValidationForm'
  import vee from '../mixins/vee'

  export default {
    name: 'create-procurement-plan',

    mixins: [HandleValidationForm, vee],

    components: {
      VSelectWarehouse,
      VField,
      VVariantTable,
      VDrawer,
      AddVariantForm,
      'v-search': require('./Search'),
      'v-product-list': require('./ProductList'),
      'v-text': require('../tailwind-vue/components/VText/Text'),
      'v-textarea': require('../tailwind-vue/components/VTextarea/Textarea')
    },

    data () {
      return {
        hidden: false,
        modal: false,
        variants: [],
        status: 'pending',

        fields: [
          {
            component: 'v-select-warehouse',
            name: '采购仓库',
            attribute: 'warehouse_id',
            value: null,
            rule: 'required',
            fetchResources: () => axios.get('/api/warehouses', {
              params: {
                include: ['type']
              }
            })
          },
          {
            component: 'v-select-warehouse',
            name: '采购员',
            attribute: 'user_id',
            value: null,
            rule: 'required',
            fetchResources: () => axios.get('/api/users')
          },
          {
            component: 'v-textarea',
            name: '采购说明',
            attribute: 'description',
            value: null,
            rule: 'required'
          },
          {
            component: 'v-textarea',
            name: '备注信息',
            attribute: 'comment',
            value: null,
            rule: ''
          },
        ]
      }
    },

    methods: {
      variantChange () {

      },
      inArray (ProviderId, variantId) {
        return this.variants.find(item => item.provider.id === ProviderId && item.variant.id === variantId)
      },
      save ({variant, edit, index}) {
        const variantId = _.get(variant, 'variant.id')
        const ProviderId = _.get(variant, 'provider.id')
        // 非编辑模式
        if (!edit) {
          if (this.inArray(ProviderId, variantId)) {
            this.$toasted.show('请勿重复添加', {type: 'error'})
            return
          }
          this.variants.push(variant)
          this.$toasted.show('添加成功', {type: 'success'})
        } else {
          // 编辑模式
          this.variants.splice(index, 1, variant)
          this.$toasted.show('修改成功', {type: 'success'})
        }
        Nova.$emit('close-add-variant-form')

      },

      async store () {
        if (await this.$validator.validateAll()) {
          const formData = this.fields.reduce((res, field) => {
            res[field.attribute] = field.value
            return res
          }, {})

          formData.status = this.status

          formData.variants = this.variants.map(item => {
            return {
              product_id: item.variant.product_id,
              product_variant_id: item.variant.id,
              price: item.variant.price,
              pcs: item.pcs,
              offer_price: item.offerPrice,
              user_id: formData.user_id,
              product_provider_id:item.provider.id
            }
          })

          try {
            await axios.post('/api/procurement-plans', formData)
            this.$toasted.show('创建成功', {type: 'success'})
          } catch (e) {
            console.error(e)
            this.$toasted.show('创建失败', {type: 'error'})
          }

        }
      }
    },

    computed: {
      styles () {
        return this.variants.length <= 0 ? {'min-height': 300 + 'px'} : {}
      }
    },

    mounted () {
    },
    destroyed () {
    }
  }
</script>

<style scoped>
    /* side list style */

    /* Scoped Styles */
    .v-default-field:last-child {
        border-bottom: none;
    }
</style>
