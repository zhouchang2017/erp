Nova.booting((Vue, router) => {
    Vue.component('index-belongs-to-many-option', require('./components/IndexField'));
    Vue.component('detail-belongs-to-many-option', require('./components/DetailField'));
    Vue.component('form-belongs-to-many-option', require('./components/FormField'));
})
