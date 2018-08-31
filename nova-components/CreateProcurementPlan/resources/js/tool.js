import VeeValidate from 'vee-validate'

Nova.booting((Vue, router) => {
  Vue.use(VeeValidate);

  Vue.mixin({
    $_veeValidate: {
      validator: 'new'
    },
    methods: {
      $setErrorsFromResponse (errorResponse) {
        if (!this.hasOwnProperty('$validator')) {
          return
        }

        // clear errors
        this.$validator.errors.clear()

        // check if errors exist
        if (!errorResponse.hasOwnProperty('errors')) {
          return
        }

        const errorFields = Object.keys(errorResponse.errors)

        // insert laravel errors
        errorFields.map(field => {
          const errorString = errorResponse.errors[field].join(', ')
          this.$validator.errors.add({field, msg: errorString})
        })
      }
    }
  })


  router.addRoutes([
    {
      name: 'create-procurement-plan',
      path: '/create-procurement-plan',
      component: require('./components/Tool'),
    },
  ])
})
