<template>
    <div>
        <attribute-form v-bind="$props" v-model="attributes" ref="attributeForm"></attribute-form>

        <div class="flex py-4">
            <button type="button" class="ml-auto btn btn-default btn-primary" @click="submit">
                Submit
            </button>
        </div>
    </div>
</template>

<script>
  export default {
    props: ['resourceName', 'resourceId', 'field'],

    components: {
      'attribute-form': require('./AttributeForm'),
    },

    data () {
      return {
        attributes: [],
      }
    },

    methods: {
      getFormData () {
        const attributes = this.attributes
        const variants = this.$refs.attributeForm.variants
        return {attributes, variants}
      },

      async submit () {
        try {
          let res = await axios.put(`/api/products/${this.resourceId}/update-attributes`, this.getFormData())
          this.$toasted.show('Create Or Update Success!', {type: 'success'})
          console.log(res)
        } catch (e) {
          console.error(e)
          this.$toasted.show('error!', {type: 'error'})
        }

      }
    }
  }
</script>
