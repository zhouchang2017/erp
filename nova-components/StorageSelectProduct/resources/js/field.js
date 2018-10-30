Nova.booting((Vue, router) => {
  // Vue.config.devtools = true
    Vue.component('index-storage-select-product', require('./components/fields/IndexField'));
    Vue.component('detail-storage-select-product', require('./components/fields/DetailField'));
    Vue.component('form-storage-select-product', require('./components/fields/FormField'));
})
