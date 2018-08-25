<template>
    <default-field-col :field="field" wrap>
        <template slot="field">
            <div class="mr-3 mb-2 flex flex-warp items-center" v-for="item in field.values" :key="genId(item)">

                    <input
                            class="mr-2 leading-tight"
                            type="checkbox"
                            :id="genId(item)"
                            :name="item.value"
                            :value="item"
                            v-model="field.value"
                    />
                    <label class="block uppercase tracking-wide text-grey-darker text-xs mr-2 cursor-pointer" :for="genId(item)">
                        {{item.value}}
                    </label>

            </div>
        </template>
    </default-field-col>
</template>

<script>
  import baseField from '../mixins/baseField'
  export default {
    name: 'CheckBoxGroup',
    mixins:[baseField],
    components: {
      'default-field-col':require('./DefaultFieldCol')
    },

    data () {
      return {

      }
    },

    methods: {
      toggle () {
        this.value = !this.value
      },
    },

    computed: {
      checked () {
        return Boolean(this.value)
      },

      trueValue () {
        return +this.checked
      },
    },
  }
</script>

<style scoped>

</style>