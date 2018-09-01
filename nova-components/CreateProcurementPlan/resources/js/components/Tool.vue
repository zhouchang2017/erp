<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">Create ProcurementPlan</h4>
            <div class="ml-auto flex">
                <button class="btn btn-default btn-primary" @click="hidden = true">choose product</button>
            </div>
        </div>

        <card class="card mb-6 py-3 px-6">
            <v-select-warehouse v-model="warehouseId"></v-select-warehouse>
        </card>

        <card class="bg-10 flex flex-col items-center overflow-hidden" :class="{'justify-center':variants.length<=0}"
              style="min-height: 300px">
            <v-variant-table v-model="variants" @choose-product="hidden = true"></v-variant-table>
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

  export default {
    name: 'create-procurement-plan',

    components: {
      VSelectWarehouse,
      VField,
      VVariantTable,
      VDrawer,
      AddVariantForm,
      'v-search': require('./Search'),
      'v-product-list': require('./ProductList')
    },

    data () {
      return {
        hidden: false,
        modal: false,
        variants: [],
        warehouseId: null
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

      }
    },

    mounted () {

    },
    destroyed () {
    }
  }
</script>

<style>
    /* side list style */

    /* Scoped Styles */

</style>
