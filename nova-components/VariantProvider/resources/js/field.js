Nova.booting((Vue, router) => {
    Vue.component('index-variant-provider', require('./components/IndexField'));
    Vue.component('detail-variant-provider', require('./components/DetailField'));
    Vue.component('form-variant-provider', require('./components/FormField'));
})
