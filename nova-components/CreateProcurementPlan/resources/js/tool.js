// require('vuetify/src/stylus/app.styl')


Nova.booting((Vue, router) => {

  router.addRoutes([
    {
      name: 'create-procurement-plan',
      path: '/create-procurement-plan',
      component: require('./components/Tool'),
    },
  ])
})
