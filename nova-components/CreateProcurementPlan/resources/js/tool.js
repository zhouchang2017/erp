import { VueSlideoutPanel } from 'vue2-slideout-panel'

Nova.booting((Vue, router) => {
  Vue.component('slideout-panel', VueSlideoutPanel)
  Vue.component('product-modal', require('./components/ProductModal'))
  router.addRoutes([
    {
      name: 'create-procurement-plan',
      path: '/create-procurement-plan',
      component: require('./components/Tool'),
    },
  ])
})
