Nova.booting((Vue, router) => {
    router.addRoutes([
        {
            name: 'amazon-mws',
            path: '/amazon-mws',
            component: require('./components/Tool'),
        },
    ])
})
