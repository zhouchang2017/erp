let mix = require('laravel-mix')
const path = require('path')
mix.js('resources/js/tool.js', 'dist/js')
  .sass('resources/sass/tool.scss', 'dist/css')

  .webpackConfig({
    resolve: {
      alias: {
        '@': path.resolve(__dirname, '../../', 'vendor/laravel/nova/resources/js/'),
      },
    },
  })