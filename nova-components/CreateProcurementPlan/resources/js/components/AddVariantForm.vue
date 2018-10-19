<template>
    <transition name="fade">
        <modal @modal-close="value = false" class="z-501" ref="modal" v-if="value">
            <div
                    ref="modelContext"
                    class="bg-white rounded-lg shadow-lg overflow-hidden"
                    style="width: 600px" :class="{'overflow-y-scroll':overFlow}"
            >
                <div class="p-8">
                    <heading :level="2" class="mb-6">{{title}}</heading>
                    <div>
                        <v-field :field="{name:'产品名称'}">
                            <template slot="field">
                                <p class="text-80 pt-2">{{productName}}</p>
                            </template>
                        </v-field>

                        <v-field :field="{name:'变体属性'}">
                            <template slot="field">
                                <p class="text-80 pt-2">{{productAttr}}</p>
                            </template>
                        </v-field>

                        <v-field :field="{name:'SKU'}">
                            <template slot="field">
                                <p class="text-80 pt-2">{{productSku}}</p>
                            </template>
                        </v-field>

                        <v-field :field="{name:'参考价'}">
                            <template slot="field">
                                <input
                                        name="price"
                                        v-model.trim="currentAddVariant.price"
                                        class="w-full form-control form-input form-input-bordered"
                                        :class="errorClasses"
                                        placeholder="参考价"
                                        readonly
                                />
                            </template>
                        </v-field>

                        <v-field :field="{name:'供应商'}" v-if="currentAddVariant.variant">
                            <template slot="field">
                                <v-select
                                        name="provider"
                                        v-validate="'required'"
                                        v-model='currentAddVariant.provider'
                                        :data='currentAddVariant.variant.providers'
                                        trackBy="id"
                                        :error="errors.first('provider')"
                                        searchBy='name'
                                        class="mb-3 border-danger"
                                        :disabled="edit"
                                >
                                    <div v-if="currentAddVariant.provider" class="flex items-center">
                                        {{ currentAddVariant.provider.name }}
                                    </div>

                                    <div slot="option" slot-scope="{option, selected}"
                                         class="flex flex-row items-center">
                                        <!--<div v-if="option.avatar" class="mr-3">-->
                                        <!--<img :src="option.avatar" class="w-8 h-8 rounded-full block" />-->
                                        <!--</div>-->
                                        <img class="h-8 rounded-full block mr-4"
                                             src="https://img.alicdn.com/imgextra/i4/2616970884/TB2gWr5XWmgSKJjSspiXXXyJFXa_!!2616970884.jpg"
                                             alt="">
                                        <div class="flex flex-1 flex-col">
                                            <div class="leading-tight text-xl">{{ option.name }}</div>
                                            <div class="text-xs">{{option.code}}</div>
                                        </div>
                                        <div v-if="option.pivot && option.pivot.price" class="text-xs">
                                            报价：{{option.pivot.price}}
                                        </div>
                                    </div>
                                </v-select>

                                <p v-if="errors.first('provider')" class="my-2 text-danger">
                                    {{ errors.first('provider') }}
                                </p>

                            </template>
                        </v-field>

                        <v-field :field="{name:'供应商报价'}">
                            <template slot="field">
                                <input
                                        name="offerPrice"
                                        v-model="currentAddVariant.offer_price"
                                        class="w-full form-control form-input form-input-bordered"
                                        v-validate="'required'"
                                        :class="{'border-danger':errors.first('offerPrice')}"
                                        placeholder="请输入供应商报价"
                                />

                                <p v-if="errors.first('offerPrice')" class="my-2 text-danger">
                                    {{ errors.first('offerPrice') }}
                                </p>
                            </template>
                        </v-field>

                        <v-field :field="{name:'采购数量'}">
                            <template slot="field">
                                <input
                                        name="pcs"
                                        v-model.number="currentAddVariant.pcs"
                                        v-validate="'required|min:1|numeric'"
                                        class="w-full form-control form-input form-input-bordered"
                                        :class="{'border-danger':errors.first('pcs')}"
                                        placeholder="请输入采购数量"
                                />

                                <p v-if="errors.first('pcs')" class="my-2 text-danger">
                                    {{ errors.first('pcs') }}
                                </p>
                            </template>
                        </v-field>

                    </div>
                </div>

                <div class="bg-30 px-6 py-3 flex">
                    <div class="ml-auto">
                        <button dusk="cancel-upload-delete-button" type="button" data-testid="cancel-button"
                                @click.prevent="value = false" class="btn text-80 font-normal h-9 px-3 mr-3 btn-link">
                            {{__('Cancel')}}
                        </button>
                        <button ref="handleSubmit"
                                @click.prevent="handleSubmit" class="btn btn-default btn-primary">Submit
                        </button>
                    </div>
                </div>
            </div>
        </modal>
    </transition>
</template>

<script>
  import VField from '../tailwind-vue/components/VField/Field'
  import VSelect from '../tailwind-vue/components/VSelect/Select'
  import vee from '../mixins/vee'

  export default {
    name: 'add-variant-form',
    components: {VSelect, VField},

    mixins: [vee],
    props: {
      title: {
        type: String,
        default: '完成采购明细'
      },
      selected: {
        type: Array,
        default: []
      }
    },

    data () {
      return {
        currentAddVariant: {
          provider: null,
          offer_price: 0,
          price: 0,
          pcs: 0,
          variant: null
        },
        productName: '加载中',
        productSku: '加载中',
        productAttr: '加载中',
        value: false,
        overFlow: false,
        edit: false,
        index: undefined
      }
    },
    methods: {
      async handleSubmit () {
        if (await this.$validator.validateAll()) {
          this.$emit('procurement-plan-save-variant', {
            variant: this.currentAddVariant,
            edit: this.edit,
            index: this.index
          })
        }
      },
      initForm () {
        this.currentAddVariant = {
          provider: null,
          offer_price: 0,
          price: 0,
          pcs: 0,
          variant: null
        }
      }
    },
    watch: {
      'currentAddVariant.provider': function (val, oldVal) {
        if (val && val !== oldVal) {
          this.currentAddVariant.offer_price = val.pivot.price
        }
      },
      'currentAddVariant.variant': function (val) {
        if (val) {
          this.currentAddVariant.price = val.price
          this.productName = val.product.name
          this.productAttr = val.attribute_key
          this.productSku = val.sku
        }
      },
      'value': function (value) {
        if (value) {
          setTimeout(() => {
            if (innerHeight - this.$refs.modelContext.clientHeight < 50) {
              this.$refs.modelContext.style.maxHeight = `${innerHeight - 100}px`
              this.overFlow = true
            }
          }, 50)
        }
      }
    },

    /**
     * Mount the component.
     */
    mounted () {
      Nova.$on('open-add-variant-form', ({variant, edit = false, index = undefined}) => {
        this.initForm()
        this.currentAddVariant = Object.assign({}, this.currentAddVariant, edit ? variant : {variant})
        this.edit = edit
        this.value = true
        this.index = index
      })
      Nova.$on('close-add-variant-form', () => {
        this.value = false
      })
    },
    destroyed () {
      Nova.$off('open-add-variant-form')
      Nova.$off('close-add-variant-form')
    }
  }
</script>
