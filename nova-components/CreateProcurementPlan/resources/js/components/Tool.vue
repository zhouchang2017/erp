<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">Create ProcurementPlan</h4>
            <div class="ml-auto flex">
                <button class="btn btn-default btn-primary" @click="show">choose product</button>
            </div>
        </div>


        <card class="bg-10 flex flex-col items-center justify-center" style="min-height: 300px">

        </card>

        <!--<product-modal/>-->
        <slideout-panel></slideout-panel>
    </div>
</template>

<script>
  import { vueSlideoutPanelService } from 'vue2-slideout-panel'

  export default {
    name: 'create-procurement-plan',

    components: {
      // 'product-modal': require('./ProductModal')
    },

    data () {
      return {
        hidden: false
      }
    },

    methods: {
      show () {
        vueSlideoutPanelService.show({
          width: 700,
          component: 'product-modal'
        })
      }
    },

    mounted () {
      //
    },
  }
</script>

<style>
    /* Scoped Styles */
</style>
