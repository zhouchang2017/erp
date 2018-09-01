import VeeValidate from 'vee-validate'

Nova.booting((Vue, router) => {
    Vue.use(VeeValidate,{inject: false});
    router.addRoutes([
        {
            name: 'create-procurement-plan-tool',
            path: '/create-procurement-plan-tool',
            component: require('./components/Tool'),
        },
    ])
})
