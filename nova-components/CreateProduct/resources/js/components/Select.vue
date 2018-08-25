<template>
    <default-field-col :field="field">
        <template slot="field">
            <select
                    :id="field.name"
                    v-model="field.value"
                    class="w-full form-control form-select"
            >
                <option value="" selected disabled>
                    {{__('Choose an option')}}
                </option>

                <option
                        v-for="option in field.values"
                        :value="option"
                        :selected="option == field.value"
                >
                    {{ option.value }}
                </option>
            </select>

        </template>
    </default-field-col>
</template>

<script>
  import baseField from '../mixins/baseField'

  export default {
    name: 'Text',

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