<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">Amazon Report Details</h4>
        </div>

        <loading-card :loading="loading">
            <div class="overflow-x-auto">
                <div class="text-center" v-if="report.length <= 0">
                    <svg xmlns="http://www.w3.org/2000/svg" width="65" height="51" viewBox="0 0 65 51" class="mb-3">
                        <g id="Page-1" fill="none" fill-rule="evenodd">
                            <g id="05-blank-state" fill="#A8B9C5" fill-rule="nonzero" transform="translate(-779 -695)">
                                <path id="Combined-Shape"
                                      d="M835 735h2c.552285 0 1 .447715 1 1s-.447715 1-1 1h-2v2c0 .552285-.447715 1-1 1s-1-.447715-1-1v-2h-2c-.552285 0-1-.447715-1-1s.447715-1 1-1h2v-2c0-.552285.447715-1 1-1s1 .447715 1 1v2zm-5.364125-8H817v8h7.049375c.350333-3.528515 2.534789-6.517471 5.5865-8zm-5.5865 10H785c-3.313708 0-6-2.686292-6-6v-30c0-3.313708 2.686292-6 6-6h44c3.313708 0 6 2.686292 6 6v25.049375c5.053323.501725 9 4.765277 9 9.950625 0 5.522847-4.477153 10-10 10-5.185348 0-9.4489-3.946677-9.950625-9zM799 725h16v-8h-16v8zm0 2v8h16v-8h-16zm34-2v-8h-16v8h16zm-52 0h16v-8h-16v8zm0 2v4c0 2.209139 1.790861 4 4 4h12v-8h-16zm18-12h16v-8h-16v8zm34 0v-8h-16v8h16zm-52 0h16v-8h-16v8zm52-10v-4c0-2.209139-1.790861-4-4-4h-44c-2.209139 0-4 1.790861-4 4v4h52zm1 39c4.418278 0 8-3.581722 8-8s-3.581722-8-8-8-8 3.581722-8 8 3.581722 8 8 8z"></path>
                            </g>
                        </g>
                    </svg>
                    <h3 class="text-base text-80 font-normal mb-6">
                        该报告无数据。
                    </h3>
                    <span class="ml-auto">
            </span>
                </div>
                <table
                        v-else
                        class="table  w-full"
                        cellpadding="0"
                        cellspacing="0">
                    <thead>
                    <th class="text-left" v-for="header in headers" :key="header.text">{{header.text}}</th>
                    </thead>
                    <tbody>
                    <tr v-for="(item,index) in report"
                        :key="index">
                        <td v-for="header in headers" :key="header.text">
                            <span class="whitespace-no-wrap text-left">{{getColValue(item,header.value,header.filter)}}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </loading-card>
    </div>
</template>

<script>
  export default {
    name: 'report-show',
    data () {
      return {
        report: [],
        loading: true,
        headers: []
      }
    },
    methods: {
      async fetchReport (amazon, id) {
        try {
          this.report = (await axios.get(`/nova-vendor/amazon-mws/${amazon}/reports/${id}`)).data
          this.setHeader(this.report)
          this.loading = false
        } catch (e) {

        }
      },
      setHeader (data) {
        if (data.length > 0) {
          let row = data[0]
          const keys = Object.keys(row)
          this.headers = keys.map(item => ({text: item, value: item}))
        }
      },
      getColValue (item, key, filter) {
        if (filter) {
          return this[filter](_.get(item, key))
        }
        return _.get(item, key, '-')
      }
    },
    mounted () {
      const {amazon, id} = this.$route.params
      this.fetchReport(amazon, id)
    }
  }
</script>

<style scoped>

</style>