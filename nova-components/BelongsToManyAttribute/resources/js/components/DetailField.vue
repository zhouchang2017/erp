<template>
    <div>
        <template v-if="checkedAttribute.length>0">
            <translation-detail-field v-for="(attr,index) in checkedAttribute" :key="attr.name"
                                      :field="attr"
                                      :style="{borderBottomWidth: index ===checkedAttribute.length-1 ? '0':'1px'}"
            ></translation-detail-field>
        </template>
        <p v-else>-</p>
    </div>
</template>

<script>
  import TranslationDetailField from './TranslationDetailField'
  import Helper from '../helper'

  export default {
    props: ['resource', 'resourceName', 'resourceId', 'field'],

    mixins: [Helper],

    components: {
      TranslationDetailField
    },

    mounted(){
      this.setAttributes()
    }
  }
</script>
