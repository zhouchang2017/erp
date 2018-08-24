Nova.booting((Vue, router) => {
    Vue.component('index-product-attributes', require('./components/IndexField'));
    Vue.component('detail-product-attributes', require('./components/DetailField'));
    Vue.component('form-product-attributes', require('./components/FormField'));
})
