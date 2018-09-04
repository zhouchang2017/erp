<template>
    <default-field :field="field">
        <template slot="field">
            <v-select
                    :name="field.name"
                    v-validate="field.rule"
                    v-model='value'
                    :data='resources'
                    :trackBy="field.trackBy"
                    :error="hasError"
                    searchBy='name'
                    class="mb-3 border-danger"
                    :disabled="edit"
                    @change="val=>$emit('input',val.id)"
            >
                <div v-if="value" class="flex items-center">
                    {{ value.name }}
                </div>

                <div slot="option" slot-scope="{option, selected}"
                     class="flex flex-row items-center">
                    <img v-if="option.avatar" class="h-8 rounded-full block mr-4"
                         src="https://img.alicdn.com/imgextra/i4/2616970884/TB2gWr5XWmgSKJjSspiXXXyJFXa_!!2616970884.jpg"
                         alt="">
                    <div class="flex flex-1 flex-col">
                        <div class="leading-tight text-xl">{{ option.name }}</div>
                        <div class="text-xs" v-if="option.type && option.type.name">{{option.type.name}}</div>
                    </div>
                </div>
            </v-select>
            <p v-if="hasError" class="my-2 text-danger">
                {{ firstError }}
            </p>
        </template>
    </default-field>
</template>

<script>
  import VSelect from '../tailwind-vue/components/VSelect/Select'
  import HandleValidationField from '../tailwind-vue/mixins/handleValidationField'
  import FormField from '../tailwind-vue/mixins/formField'

  export default {
    name: 'v-select-warehouse',
    components: {VSelect},
    mixins: [FormField, HandleValidationField],

    props: {
      edit: {
        type: Boolean,
        default: false
      }
    },

    data () {
      return {
        value: null
      }
    },

    methods: {
      async fetchResources () {
        const {data: {data}} = await this.field.fetchResources()
        this.resources = data
      },
      initialValue () {
        if (this.field.trackBy && this.field.value) {
          this.value = _.find(this.resources, [this.field.trackBy, this.field.value]) || ''
        }
      },
    },

    async mounted () {
      await this.fetchResources()
      this.initialValue()
    }
  }
</script>

<style scoped>

</style>