<template>
    <default-field-col :field="field">
        <template slot="field">
            <div class="mr-3 mb-2 flex flex-warp items-center" v-for="item in field.values" :key="genId(item)">

                <input class="mr-2 leading-tight" type="radio" :id="genId(item)" :name="item.value" :value="item"
                       v-model="field.value">
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
    name: 'RadioGroup',

    mixins: [baseField],

    components: {
      'default-field-col': require('./DefaultFieldCol')
    },

    data () {
      return {

      }
    }
  }
</script>

<style scoped>

</style>