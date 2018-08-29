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
            <v-list/>
        </v-drawer>


        <!--<product-modal/>-->

    </div>
</template>

<script>

  export default {
    name: 'create-procurement-plan',

    components: {
      'v-drawer': require('./Drawer'),
      'v-search': require('./Search'),
      'v-list': require('./List')
    },

    data () {
      return {
        hidden: false
      }
    },

    methods: {
      show () {

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
