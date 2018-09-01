import VeeValidate from 'vee-validate'

Nova.booting((Vue, router) => {
  Vue.use(VeeValidate,{inject: false});

  router.addRoutes([
    {
      name: 'create-procurement-plan',
      path: '/create-procurement-plan',
      component: require('./components/Tool'),
    },
  ])
})
