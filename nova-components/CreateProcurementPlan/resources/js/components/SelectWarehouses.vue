<template>
    <div class="flex border-40">
        <div class="w-1/5 px-8 py-6">
            <label class="inline-block text-80 h-9 pt-2">
                仓库
            </label>
        </div>
        <div class="w-1/2 px-8 py-6">
            <v-select
                    name="warehouse"
                    v-validate="'required'"
                    v-model='warehouse'
                    :data='warehouses'
                    trackBy="id"
                    :error="errors.first('warehouse')"
                    searchBy='name'
                    class="mb-3 border-danger"
                    :disabled="edit"
                    @change="val=>$emit('input',val.id)"
            >
                <div v-if="warehouse" class="flex items-center">
                    {{ warehouse.name }}
                </div>

                <div slot="option" slot-scope="{option, selected}"
                     class="flex flex-row items-center">
                    <div class="flex flex-1 flex-col">
                        <div class="leading-tight text-xl">{{ option.name }}</div>
                        <div class="text-xs">{{option.type.name}}</div>
                    </div>
                </div>
            </v-select>
            <p v-if="errors.first('warehouse')" class="my-2 text-danger">
                {{ errors.first('warehouse') }}
            </p>
        </div>
    </div>
</template>

<script>
  import VSelect from '../tailwind-vue/components/VSelect/Select'
  import vee from '../mixins/vee'

  export default {
    name: 'v-select-warehouse',
    components: {VSelect},
    mixins: [vee],
    model: {
      event: 'input',
      prop: 'value'
    },

    props: {
      value: {
        type: Number
      },
      edit: {
        type: Boolean,
        default: false
      }
    },

    data () {
      return {
        warehouses: [],
        warehouse: null
      }
    },

    methods: {
      async fetchWarehouses () {
        const {data: {data}} = await axios.get('/api/warehouses', {
          params: {
            include: ['type']
          }
        })
        this.warehouses = data
      }
    },

    async mounted () {
      await this.fetchWarehouses()
    }
  }
</script>

<style scoped>

</style>