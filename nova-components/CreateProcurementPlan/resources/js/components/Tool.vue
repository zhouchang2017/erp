<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">{{title}}</h4>
            <div class="ml-auto flex">
                <button class="btn btn-default btn-primary" @click="hidden = true">{{__('Choose Product')}}</button>
            </div>
        </div>

        <card class="mb-6 py-3 px-6" v-if="loaded">
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
                <select v-model="status" :disabled="selectDisable" class="form-control form-select ml-auto mr-3">
                    <option :value="item.value" v-for="item in statusList" :key="item.value" :disabled="item.disabled">
                        {{item.text}}
                    </option>
                </select>
                <button class="btn btn-default btn-primary" @click="beforeSubmit" :disabled="selectDisable">
                    {{buttonTitle}}
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

    props: {
      id: null,
      resourceName: {
        type: String,
        default: 'procurement-plans'
      }
    },

    data () {
      return {
        hidden: false,
        modal: false,
        variants: [],
        status: 'pending',
        fields: [],
        origin: {},
        loaded: false,
        config: {
          // 新建手工入库
          manuallies: {
            name: 'Manually',
            createApi: '',
            updateApi: '',
            showApi: '',
            queryBuild: {},
            status: [
              {value: 'uncommitted', text: this.__('Save'), disabled: false},
              {value: 'pending', text: this.__('Submit Approval'), disabled: false},
              {value: 'finished', text: this.__('Finished'), disabled: true},
              {value: 'cancel', text: this.__('Cancel'), disabled: true},
              {value: 'return', text: this.__('Return Modification'), disabled: true},
            ]
          },
          // 新建采购计划
          'procurement-plans': {
            name: 'Procurement Plan',
            createApi: '',
            updateApi: '',
            showApi: '',
            queryBuild: {
              include: ['plan_info.provider', 'plan_info.variant.product']
            },
            status: [
              {value: 'uncommitted', text: this.__('Save'), disabled: false},
              {value: 'pending', text: this.__('Submit Approval'), disabled: false},
              {value: 'already', text: this.__('Already'), disabled: true},
              {value: 'cancel', text: this.__('Cancel'), disabled: true},
              {value: 'return', text: this.__('Return Modification'), disabled: true},
            ]
          }
        }
      }
    },

    methods: {

      fetchDetails () {
        return axios.get(`/nova-vendor/create-procurement-plan/${this.resourceName}/${this.id}`,
          {params: _.get(this, `config.${this.resourceName}.queryBuild`)}
        )
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

      async beforeSubmit () {
        if (await this.$validator.validateAll()) {
          const formData = this.fields.reduce((res, field) => {
            res[field.attribute] = field.value
            return res
          }, {})

          formData.status = this.status

          formData.variants = this.variants.map(item => {
            const id = item.id ? {id: item.id} : {}
            return Object.assign({}, {
              product_id: item.variant.product_id,
              product_variant_id: item.variant.id,
              price: item.variant.price,
              pcs: item.pcs,
              offer_price: item.offer_price,
              user_id: formData.user_id,
              product_provider_id: item.provider.id
            }, id)
          })
          this.id ? this.update(formData) : this.store(formData)
        }
      },

      async store (formData) {
        try {
          await axios.post(`/nova-vendor/create-procurement-plan/${this.resourceName}`, formData)
          this.$toasted.show(this.__('The :resource was created!', {
            resource: this.__('Procurement Plan'),
          }), {type: 'success'})
        } catch (e) {
          console.error(e)
          this.$toasted.show(this.__('The :resource was :action failed!', {
            resource: this.__('Procurement Plan'),
            action: this.__('Create')
          }), {type: 'error'})
        }
      },

      async update (formData) {
        try {
          await axios.post(`/nova-vendor/create-procurement-plan/${this.resourceName}/${this.id}`, formData)
          this.$toasted.show(this.__('The :resource was updated!', {
            resource: this.__('Procurement Plan'),
          }), {type: 'success'})
        } catch (e) {
          console.error(e)
          this.$toasted.show(this.__('The :resource was :action failed!', {
            resource: this.__('Procurement Plan'),
            action: this.__('Update')
          }), {type: 'error'})
        }
      },
      fill () {
        this.fields.forEach(item => {
          const value = _.get(this.origin, item['attribute'])
          if (value) {
            item.value = value
          }
        })
        this.status = _.get(this.origin, 'status', 'pending')
        this.variants = _.get(this.origin, 'plan_info', [])
        this.loaded = true
      },
      genFields () {
        const fields = [
          {
            component: 'v-select-warehouse',
            name: this.__('Warehouse'),
            attribute: 'warehouse_id',
            value: null,
            rule: 'required',
            trackBy: 'id',
            fetchResources: () => axios.get('/nova-vendor/create-procurement-plan/warehouses', {
              params: {
                include: ['type']
              }
            })
          },
          {
            component: 'v-select-warehouse',
            name: this.__('Salesman'),
            attribute: 'user_id',
            value: null,
            rule: 'required',
            trackBy: 'id',
            fetchResources: () => axios.get('/nova-vendor/create-procurement-plan/users')
          },
          {
            component: 'v-textarea',
            name: `${this.__(this.name)}${this.__('Description')}`,
            attribute: 'description',
            value: null,
            rule: 'required'
          },
        ]
        if (this.resourceName === 'procurement-plans') {
          fields.push({
            component: 'v-textarea',
            name: this.__('Comment'),
            attribute: 'comment',
            value: null,
            rule: ''
          })
        }
        this.fields = fields
      }
    },

    computed: {
      styles () {
        return this.variants.length <= 0 ? {'min-height': 300 + 'px'} : {}
      },
      name () {
        return _.get(this, `config.${this.resourceName}.name`, 'Name not defined')
      },
      title () {
        return this.id ? `${this.__('Update & Editing')} ${this.__(this.name)}` : `${this.__('Create')} ${this.__(this.name)}`
      },
      buttonTitle () {
        return this.id ? `${this.__('Update')} ${this.__(this.name)}` : `${this.__('Create')} ${this.__(this.name)}`
      },
      selectDisable () {
        const disable = ['cancel', 'already']
        return disable.includes(this.status)
      },
      statusList () {
        return _.get(this, `config.${this.resourceName}.status`, [])
      }
    },
    async created () {
      this.genFields()
      if (this.id) {
        try {
          const {data: {data}} = await this.fetchDetails()
          this.origin = data
          this.fill()
        } catch (err) {
          console.error(err)
          this.$toasted.show(err, {type: 'error'})
        }
      } else {
        this.loaded = true
      }

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
