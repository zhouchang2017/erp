<template>
    <div>
        <div class="text-center" v-if="tableData.length <= 0">
            <svg xmlns="http://www.w3.org/2000/svg" width="65" height="51" viewBox="0 0 65 51" class="mb-3">
                <g id="Page-1" fill="none" fill-rule="evenodd">
                    <g id="05-blank-state" fill="#A8B9C5" fill-rule="nonzero" transform="translate(-779 -695)">
                        <path id="Combined-Shape"
                              d="M835 735h2c.552285 0 1 .447715 1 1s-.447715 1-1 1h-2v2c0 .552285-.447715 1-1 1s-1-.447715-1-1v-2h-2c-.552285 0-1-.447715-1-1s.447715-1 1-1h2v-2c0-.552285.447715-1 1-1s1 .447715 1 1v2zm-5.364125-8H817v8h7.049375c.350333-3.528515 2.534789-6.517471 5.5865-8zm-5.5865 10H785c-3.313708 0-6-2.686292-6-6v-30c0-3.313708 2.686292-6 6-6h44c3.313708 0 6 2.686292 6 6v25.049375c5.053323.501725 9 4.765277 9 9.950625 0 5.522847-4.477153 10-10 10-5.185348 0-9.4489-3.946677-9.950625-9zM799 725h16v-8h-16v8zm0 2v8h16v-8h-16zm34-2v-8h-16v8h16zm-52 0h16v-8h-16v8zm0 2v4c0 2.209139 1.790861 4 4 4h12v-8h-16zm18-12h16v-8h-16v8zm34 0v-8h-16v8h16zm-52 0h16v-8h-16v8zm52-10v-4c0-2.209139-1.790861-4-4-4h-44c-2.209139 0-4 1.790861-4 4v4h52zm1 39c4.418278 0 8-3.581722 8-8s-3.581722-8-8-8-8 3.581722-8 8 3.581722 8 8 8z"></path>
                    </g>
                </g>
            </svg>
            <h3 class="text-base text-80 font-normal mb-6">
                暂无任何报告。
            </h3>
            <span class="ml-auto">
                <button class="btn btn-sm btn-outline" @click="$emit('choose-product')">
                    {{__('Request Report')}}
                 </button>
            </span>
        </div>
        <div v-else class="overflow-hidden overflow-x-auto relative">
            <table
                    class="table  w-full"
                    cellpadding="0"
                    cellspacing="0">
                <thead>
                <th class="text-left" v-for="header in headers" :key="header.text">{{header.text}}</th>
                <th class="text-left">{{__('Report Request Id')}}</th>
                </thead>
                <tbody>
                <tr v-for="(item,index) in tableData"
                    :key="index">
                    <td v-for="header in headers" :key="header.text">
                        <span class="whitespace-no-wrap text-left">{{getColValue(item,header.value,header.filter)}}</span>
                    </td>
                    <td>
                    <span class="whitespace-no-wrap text-left">
                        <router-link v-if="getColValue(item,'GeneratedReportId.value',null)"
                                     class="no-underline dim text-primary font-bold"
                                     target="_blank"
                                     :to="{name:'amazon-mws-report-show',params:{amazon:current.id,id:item.GeneratedReportId.value},query:item}">
                            {{getColValue(item,'GeneratedReportId.value',null)}}
                        </router-link>
                        <template v-else>-</template>
                    </span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <pagination-links
                v-if="tableData"
                :resource-name="resourceName"
                :resources="tableData"
                :resource-response="value"
                @previous="$emit('prev-report')"
                @next="$emit('next-report')">
        </pagination-links>
    </div>

</template>

<script>
  moment.locale(Nova.config.locale)
  export default {
    name: 'report-table',

    model: {
      prop: 'value',
      event: 'input'
    },

    props: {
      value: {type: Array, default: () => []},
      current: {type: Object, default: () => {}},
      types: {type: Array, default: () => []}
    },

    data () {
      return {
        resourceName: 'amazon-report',
        headers: [
          {text: this.__('Report Type'), value: 'ReportType.value', filter: 'toReportType'},
          {
            text: this.__('Report Processing Status'),
            value: 'ReportProcessingStatus.value',
            filter: 'toReportProcessingStatus'
          },
          {text: this.__('Start Date'), value: 'StartDate.value', filter: 'toTimeFromNow'},
          {text: this.__('End Date'), value: 'EndDate.value', filter: 'toTimeFromNow'},
          {text: this.__('Scheduled'), value: 'Scheduled.value'},
          // {text: this.__('Report Request Id'), value: 'ReportRequestId.value'},
          {text: this.__('Submitted Date'), value: 'SubmittedDate.value', filter: 'toTimeFromNow'},
          {text: this.__('Started Processing Date'), value: 'StartedProcessingDate.value', filter: 'toTimeFromNow'},
          {text: this.__('Completed Date'), value: 'CompletedDate.value', filter: 'toTimeFromNow'}
        ],
        status: []
      }
    },
    computed: {
      tableData () {
        return _.get(this, 'value.GetReportRequestListResponse.GetReportRequestListResult.ReportRequestInfo', [])
      }
    },
    methods: {
      async fetchReportStatus () {
        this.status = (await axios.get('/nova-vendor/amazon-mws/reports/status')).data
      },
      toReportType (value) {
        return _.get(_.find(this.types, ['value', value]), 'name', value)
      },
      toReportProcessingStatus (value) {
        return _.get(_.find(this.status, ['value', value]), 'name', value)
      },
      toTimeFromNow (value) {
        return moment(value).fromNow()
      },
      getColValue (item, key, filter) {
        if (filter) {
          return this[filter](_.get(item, key))
        }
        return _.get(item, key)
      }
    },
    mounted () {
      Promise.all([
        this.fetchReportStatus()
      ])
    }
  }
</script>

<style scoped>

</style>