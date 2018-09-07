import VeeValidate from 'vee-validate'

Nova.booting((Vue, router) => {
  Vue.use(VeeValidate, {inject: false})
  router.addRoutes([
    {
      name: 'create-put-storage-plan',
      path: '/:resourceName/storage',
      component: require('./components/Tool'),
      props: route => {
        return {
          resourceName: route.params.resourceName
        }
      }
    },
    {
      name: 'update-put-storage-plan',
      path: '/:resourceName/storage/:id/edit',
      component: require('./components/Tool'),
      props: route => {
        return {
          id: +route.params.id,
          resourceName: route.params.resourceName
        }
      },
    }
  ])

})
