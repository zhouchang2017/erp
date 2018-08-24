Nova.booting((Vue, router) => {
    Vue.component('index-attribute-group-attributes', require('./components/IndexField'));
    Vue.component('detail-attribute-group-attributes', require('./components/DetailField'));
    Vue.component('form-attribute-group-attributes', require('./components/FormField'));
})
