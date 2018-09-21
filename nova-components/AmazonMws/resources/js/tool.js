Nova.booting((Vue, router) => {
  router.addRoutes([
    {
      name: 'amazon-mws',
      path: '/amazon-mws',
      component: require('./components/Tool'),
    },
    {
      name: 'amazon-mws-report-index',
      path: '/amazon-mws/report',
      component: require('./components/report'),
    },
    {
      name: 'amazon-mws-report-show',
      path: '/amazon-mws/:amazon/report/:id',
      component: require('./components/report/Show.vue'),
    },
  ])
})
