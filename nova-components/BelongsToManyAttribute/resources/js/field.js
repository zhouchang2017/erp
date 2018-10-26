Nova.booting((Vue, router) => {
  Vue.config.devtools = true;

    Vue.component('index-belongs-to-many-attribute', require('./components/IndexField'));
    Vue.component('detail-belongs-to-many-attribute', require('./components/DetailField'));
    Vue.component('form-belongs-to-many-attribute', require('./components/FormField'));
})
