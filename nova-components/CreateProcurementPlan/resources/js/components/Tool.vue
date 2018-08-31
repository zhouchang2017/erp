<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">Create ProcurementPlan</h4>
            <div class="ml-auto flex">
                <button class="btn btn-default btn-primary" @click="hidden = true">choose product</button>
            </div>
        </div>


        <card class="bg-10 flex flex-col items-center justify-center" style="min-height: 300px">

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

  export default {
    name: 'create-procurement-plan',

    components: {
      AddVariantForm,
      'v-drawer': require('./Drawer'),
      'v-search': require('./Search'),
      'v-product-list': require('./ProductList')
    },

    data () {
      return {
        hidden: false,
        modal: false,
        variants: []
      }
    },

    methods: {
      variantChange () {

      }
    },

    mounted () {
      //
    },
  }
</script>

<style>
    /* side list style */

    /* Scoped Styles */

</style>
