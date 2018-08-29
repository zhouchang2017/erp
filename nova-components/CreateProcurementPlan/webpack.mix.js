let mix = require('laravel-mix')

mix.js('resources/js/tool.js', 'dist/js')
   .sass('resources/sass/tool.scss', 'dist/css')


mix.webpackConfig({
  module:{
    rules:[
      {
        test: /\.styl$/,
        loader: ['style-loader', 'css-loader', 'stylus-loader']
      }
    ]
  }
})