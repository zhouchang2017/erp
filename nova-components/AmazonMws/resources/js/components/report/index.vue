<template>
    <div>
        <div class="flex items-center mb-3">
            <h4 class="text-90 font-normal text-2xl">Amazon Report</h4>
            <div class="ml-auto flex">
                <button class="btn btn-default btn-primary mr-3" @click="refresh">{{__('Refresh')}}</button>
                <button class="btn btn-default btn-primary" @click="showModal = true">{{__('Request Report')}}</button>
            </div>
        </div>
        <div class="select-report">
            <span v-for="item in amazons" :key="item.id" :class="{'active':item === current}" @click="current = item">{{item.name}}</span>
        </div>
        <loading-card :loading="loading">
            <card class="bg-10 mb-6 flex flex-col overflow-hidden" :class="{'justify-center':currentCount<=0}"
                  :style="styles" style="border-top-left-radius: 0">
                <report-table
                        v-model="currentData"
                        @prev-report="getPrev"
                        @next-report="getNext"
                        :current="current"
                        :types="types"
                ></report-table>
            </card>
        </loading-card>

        <transition name="fade">
            <modal @modal-close="showModal = false" ref="modal" v-show="showModal">
                <div
                        class="bg-white rounded-lg shadow-lg overflow-hidden"
                        style="width: 800px"
                >
                    <div class="p-8">
                        <heading :level="2" class="mb-6">{{__('Request Report')}}</heading>
                        <component
                                :key="field.name"
                                class="v-default-field"
                                :errors="validationErrors"
                                v-for="field in fields"
                                :is="field.component"
                                :field="field"
                        />
                    </div>

                    <div class="bg-30 px-6 py-3 flex">
                        <div class="ml-auto">
                            <button dusk="cancel-upload-delete-button" type="button" data-testid="cancel-button"
                                    @click.prevent="showModal = false"
                                    class="btn text-80 font-normal h-9 px-3 mr-3 btn-link">
                                {{__('Cancel')}}
                            </button>
                            <button ref="handleSubmit"
                                    @click.prevent="handleSubmit" class="btn btn-default btn-primary">{{__('Submit')}}
                            </button>
                        </div>
                    </div>
                </div>
            </modal>
        </transition>
    </div>
</template>

<script>

  import { Errors, Minimum, InteractsWithResourceInformation } from 'laravel-nova'

  export default {
    name: 'report-index',
    components: {
      'report-table': require('./ReportTable'),
    },
    data () {
      return {
        types: [],
        amazons: [],
        loading: true,
        reports: {},
        current: null,
        currentData: null,
        showModal: false,
        formData: {
          reportType: '',
          startDate: '',
          endDate: '',
          reportOptions: '',
          marketplaceIdList: ''
        },
        fields: [
          {
            component: 'form-select-field',
            name: this.__('Report Type'),
            attribute: 'report_type',
            value: null,
            options: this.types,
            rule: 'required',
            trackBy: 'name',
          },
          {
            component: 'form-nova-repeatable-fields',
            name: 'MarketplaceIds',
            attribute: 'marketplace_id',
            panel: 'MarketplaceIds',
            sub_fields: [{label: 'MarketplaceId', options: [], name: 'id', placeholder: '可以忽略', type: 'text'}]
          },
          {
            component: 'form-text-field',
            name: this.__('Report Options'),
            attribute: 'report_options',
            value: null,
          },
          {
            component: 'form-date-time',
            name: this.__('Start Date'),
            attribute: 'start_date',
            value: null
          },
          {
            component: 'form-date-time',
            name: this.__('End Date'),
            attribute: 'end_date',
            value: null
          }
        ],
        validationErrors: new Errors(),
      }
    },

    watch: {
      'currentId': {
        handler: async function (val, oldVal) {
          if (val) {
            if (this.reports[val] && this.reports[val].length > 0) {
              this.currentData = this.reports[val][0]
            } else {
              await this.fetchReports(val)
            }
          }
        },
        immediate: true
      }
    },

    methods: {
      async refresh(){
        this.reports[this.currentId] = []
        await this.fetchReports(this.currentId)
      },
      getPrev () {
        this.currentData = this.reports[this.currentId][this.currentData.prev_page_url - 1]
      },
      async getNext () {
        const index = this.reports[this.currentId].findIndex(item => item === this.currentData) + 1
        const count = this.reports[this.currentId].length
        if (index === count) {
          await this.fetchReportByNextToken(this.currentId, this.nextToken)
        } else {
          this.currentData = this.reports[this.currentId][index]
        }

      },
      async fetchAmazons () {
        try {
          this.amazons = (await axios.get('/nova-vendor/amazon-mws/amazons')).data
        } catch (e) {

        }
      },
      // 远程数据请求
      async fetchReports (id) {
        try {
          this.loading = true
          const {data} = await axios.get(`/nova-vendor/amazon-mws/${id}/reports`)
          this.storeReport(data)
          this.loading = false
        } catch (e) {

        }
      },
      async fetchReportByNextToken (id, nextToken) {
        try {
          this.loading = true
          const {data} = await axios.get(`/nova-vendor/amazon-mws/${id}/reports/next`, {params: {nextToken}})
          this.storeReport(data)
          this.loading = false
        } catch (e) {

        }
      },
      // 缓存数据到内存
      storeReport (data) {
        const next = _.get(data, 'GetReportRequestListResponse.GetReportRequestListResult.HasNext')
        if (next) {
          data.next_page_url = _.get(data, 'GetReportRequestListResponse.GetReportRequestListResult.NextToken.value')
        }
        const requestId = _.get(data, 'GetReportRequestListResponse.ResponseMetadata.RequestId.value')
        if (_.has(this.reports, this.currentId) && _.isArray(this.reports[this.currentId])) {
          const hasData = this.reports[this.currentId].find(item => {
            const originId = _.get(item, 'GetReportRequestListResponse.ResponseMetadata.RequestId.value')
            return originId === requestId
          })
          if (!hasData) {
            this.reports[this.currentId].push(data)
          }
          data.prev_page_url = this.reports[this.currentId].length - 1
        } else {
          this.reports[this.currentId] = []
          this.reports[this.currentId].push(data)
        }
        this.currentData = data
      },
      async handleSubmit () {
        try {
          const response = (await axios.post(`/nova-vendor/amazon-mws/${this.currentId}/reports`, this.createResourceFormData())).data

          this.$toasted.show(
            this.__('The :resource was requested!', {
              resource: this.__('Request Report'),
            }),
            {type: 'success'}
          )
          this.putNewReport(response)
          this.validationErrors = new Errors()
          this.showModal = false
        } catch (error) {
          if (error.response.status == 422) {
            this.validationErrors = new Errors(error.response.data.errors)
          }
        }
      },
      putNewReport (data) {
        const newReport = _.get(data, 'RequestReportResponse.RequestReportResult.ReportRequestInfo')
        let reportList = _.get(this.currentData, 'GetReportRequestListResponse.GetReportRequestListResult.ReportRequestInfo', [])
        reportList.unshift(newReport)
        _.set(this.currentData, 'GetReportRequestListResponse.GetReportRequestListResult.ReportRequestInfo', reportList)
      },
      createResourceFormData () {
        return _.tap(new FormData(), formData => {
          _.each(this.fields, field => {
            field.fill(formData)
          })
        })
      },
      async fetchReportTypes () {
        this.types = (await axios.get('/nova-vendor/amazon-mws/reports/types')).data
        const types = _.cloneDeep(this.types).map(item => ({value: item.value, label: item.name}))
        this.setTypes(types)
      },
      setTypes (types) {
        const typeField = _.find(this.fields, ['attribute', 'report_type'])
        this.$set(typeField, 'options', types)
      }
    },

    computed: {
      currentId () {
        return _.get(this, 'current.id', null)
      },
      currentCount () {
        return (_.get(this, 'currentData.GetReportRequestListResponse.GetReportRequestListResult.ReportRequestInfo', [])).length
      },
      styles () {
        return this.currentCount <= 0 ? {'min-height': 300 + 'px'} : {}
      },
      nextToken () {
        return _.get(this.currentData, 'next_page_url')
      }
    },

    async mounted () {
      await Promise.all([
        this.fetchAmazons(),
        this.fetchReportTypes()
      ])
      this.current = this.amazons[0]
      this.loading = false
    }
  }
</script>

<style scoped>
    .select-report {
    }

    .select-report span {
        display: inline-block;
        padding: 10px 20px;
        margin-right: 10px;
        background-color: var(--50);
        border-radius: .5rem .5rem 0 0;
        color: #7c858e;
        cursor: pointer;
    }

    .select-report span.active {
        background-color: var(--30);
        color: #333;
    }
</style>