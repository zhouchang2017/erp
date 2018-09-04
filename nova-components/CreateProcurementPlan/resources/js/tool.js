import VeeValidate from 'vee-validate'

Nova.booting((Vue, router) => {
  Vue.use(VeeValidate, {inject: false})

  router.addRoutes([
    {
      name: 'create-procurement-plan',
      path: '/procurement-plans',
      component: require('./components/Tool'),
    },
    {
      name: 'update-procurement-plan',
      path: '/procurement-plans/:id',
      component: require('./components/Tool'),
      props: route => {
        return {
          id: +route.params.id
        }
      },
    }
  ])
})
