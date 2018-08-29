webpackJsonp([2],{

/***/ 209:
/***/ (function(module, exports, __webpack_require__) {

var disposed = false
function injectStyle (ssrContext) {
  if (disposed) return
  __webpack_require__(210)
}
var normalizeComponent = __webpack_require__(18)
/* script */
var __vue_script__ = __webpack_require__(212)
/* template */
var __vue_template__ = __webpack_require__(213)
/* template functional */
var __vue_template_functional__ = false
/* styles */
var __vue_styles__ = injectStyle
/* scopeId */
var __vue_scopeId__ = "data-v-3aa4f50a"
/* moduleIdentifier (server only) */
var __vue_module_identifier__ = null
var Component = normalizeComponent(
  __vue_script__,
  __vue_template__,
  __vue_template_functional__,
  __vue_styles__,
  __vue_scopeId__,
  __vue_module_identifier__
)
Component.options.__file = "resources/js/components/ProductListItemWithVariant.vue"

/* hot reload */
if (false) {(function () {
  var hotAPI = require("vue-hot-reload-api")
  hotAPI.install(require("vue"), false)
  if (!hotAPI.compatible) return
  module.hot.accept()
  if (!module.hot.data) {
    hotAPI.createRecord("data-v-3aa4f50a", Component.options)
  } else {
    hotAPI.reload("data-v-3aa4f50a", Component.options)
  }
  module.hot.dispose(function (data) {
    disposed = true
  })
})()}

module.exports = Component.exports


/***/ }),

/***/ 210:
/***/ (function(module, exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(211);
if(typeof content === 'string') content = [[module.i, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var update = __webpack_require__(17)("6866c0fa", content, false, {});
// Hot Module Replacement
if(false) {
 // When the styles change, update the <style> tags
 if(!content.locals) {
   module.hot.accept("!!../../../node_modules/css-loader/index.js!../../../node_modules/vue-loader/lib/style-compiler/index.js?{\"vue\":true,\"id\":\"data-v-3aa4f50a\",\"scoped\":true,\"hasInlineConfig\":true}!../../../node_modules/vue-loader/lib/selector.js?type=styles&index=0!./ProductListItemWithVariant.vue", function() {
     var newContent = require("!!../../../node_modules/css-loader/index.js!../../../node_modules/vue-loader/lib/style-compiler/index.js?{\"vue\":true,\"id\":\"data-v-3aa4f50a\",\"scoped\":true,\"hasInlineConfig\":true}!../../../node_modules/vue-loader/lib/selector.js?type=styles&index=0!./ProductListItemWithVariant.vue");
     if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
     update(newContent);
   });
 }
 // When the module is disposed, remove the <style> tags
 module.hot.dispose(function() { update(); });
}

/***/ }),

/***/ 211:
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(2)(false);
// imports


// module
exports.push([module.i, "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", ""]);

// exports


/***/ }),

/***/ 212:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  name: 'ProductListItemWithVariant',
  props: {
    product: {
      type: Object,
      default: function _default() {}
    },
    relationed: {
      type: Array,
      default: function _default() {
        return [];
      }
    }
  },
  computed: {
    hasGroup: function hasGroup() {
      return _.has(this.product, 'variants.data');
    },
    isComponent: function isComponent() {
      return this.hasGroup ? 'v-list-group' : 'span';
    },
    listTileBind: function listTileBind() {
      return this.hasGroup ? { slot: 'activator' } : {};
    },
    isComponentBind: function isComponentBind() {
      return this.hasGroup ? { noAction: true } : {};
    },
    avatar: function avatar() {
      return this.product.avatars && this.product.avatars.data.length > 0 && this.product.avatars.data[0].thumb.url;
    },
    variants: function variants() {
      return _.get(this.product, 'variants.data', []);
    },
    productIds: function productIds() {
      return ProductProvider.productIds(+this.$route.params.id);
    },
    name: function name() {
      return _.get(this.product, 'name', 'the product name not found !');
    },
    type: function type() {
      return _.isString(_.get(this.product, 'type')) ? _.get(this.product, 'type') : _.get(this.product, 'type.data.name', 'product type not found!');
    },
    brand: function brand() {
      return _.isString(_.get(this.product, 'brand')) ? _.get(this.product, 'brand') : _.get(this.product, 'brand.data.name', 'product brand not found!');
    },
    providerOffer: function providerOffer() {
      return ProductProvider.providerOffer(+this.$route.params.id);
    },
    price: function price() {
      var _this = this;

      return function (id) {
        return _this.providerOffer.find(function (item) {
          return item.product_variant_id === id;
        });
      };
    }
  }
});

/***/ }),

/***/ 213:
/***/ (function(module, exports, __webpack_require__) {

var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    _vm.isComponent,
    _vm._b({ tag: "component" }, "component", _vm.isComponentBind, false),
    [
      _c(
        "v-list-tile",
        _vm._b(
          { key: _vm.product.id, attrs: { avatar: "" } },
          "v-list-tile",
          _vm.listTileBind,
          false
        ),
        [
          _c(
            "v-list-tile-avatar",
            {
              staticClass: "headline font-weight-light white--text",
              attrs: { tile: "", size: "48", color: "indigo" }
            },
            [
              _vm.avatar
                ? _c("v-img", { attrs: { src: _vm.avatar, alt: "" } })
                : [
                    _vm._v(
                      "\n                " +
                        _vm._s(_vm.name.charAt(0)) +
                        "\n            "
                    )
                  ]
            ],
            2
          ),
          _vm._v(" "),
          _c(
            "v-list-tile-content",
            [
              _c("v-list-tile-title", [_vm._v(_vm._s(_vm.name))]),
              _vm._v(" "),
              _c(
                "v-list-tile-sub-title",
                [
                  _c(
                    "v-layout",
                    { attrs: { row: "", wrap: "" } },
                    [
                      _c(
                        "v-flex",
                        [
                          _c(
                            "v-chip",
                            {
                              attrs: {
                                outline: "",
                                small: "",
                                color: "primary"
                              }
                            },
                            [
                              _vm._v(
                                _vm._s(_vm.type) + "\n                        "
                              )
                            ]
                          ),
                          _vm._v(" "),
                          _c(
                            "v-chip",
                            {
                              attrs: {
                                color: "secondary",
                                "text-color": "white",
                                small: ""
                              }
                            },
                            [
                              _vm._v(
                                _vm._s(_vm.brand) + "\n                        "
                              )
                            ]
                          ),
                          _vm._v(" "),
                          _vm._t(
                            "sub-title",
                            [_vm._v(_vm._s(_vm.product.name_en))],
                            { product: _vm.product }
                          )
                        ],
                        2
                      )
                    ],
                    1
                  )
                ],
                1
              )
            ],
            1
          ),
          _vm._v(" "),
          _vm._t("action", null, { product: _vm.product })
        ],
        2
      ),
      _vm._v(" "),
      _vm._l(_vm.variants, function(variant, index) {
        return [
          _c(
            "v-list-tile",
            {
              key: variant.sku,
              on: {
                click: function($event) {
                  _vm.$emit("edit", { variant: variant, name: _vm.name })
                }
              }
            },
            [
              _c(
                "v-list-tile-content",
                [
                  _c(
                    "v-list-tile-title",
                    { staticClass: "font-weight-regular" },
                    [_vm._v("属性:" + _vm._s(variant.attribute_key))]
                  ),
                  _vm._v(" "),
                  _c("v-list-tile-sub-title", [
                    _vm._v("sku: " + _vm._s(variant.sku))
                  ])
                ],
                1
              ),
              _vm._v(" "),
              _vm._t(
                "sub-list-tile-action",
                [
                  _vm.price(variant.id)
                    ? _c(
                        "v-list-tile-action",
                        [
                          _c(
                            "v-layout",
                            { attrs: { row: "", wrap: "" } },
                            [
                              _c(
                                "v-flex",
                                [
                                  _vm._v(
                                    "\n\n                            报价: " +
                                      _vm._s(_vm.price(variant.id).price) +
                                      "\n                            "
                                  ),
                                  _c(
                                    "v-btn",
                                    {
                                      attrs: { icon: "", ripple: "" },
                                      on: {
                                        click: function($event) {
                                          $event.stopPropagation()
                                          _vm.$emit("detach", {
                                            variant: variant,
                                            name: _vm.name
                                          })
                                        }
                                      }
                                    },
                                    [
                                      _c(
                                        "v-icon",
                                        { attrs: { color: "grey lighten-1" } },
                                        [_vm._v("cancel")]
                                      )
                                    ],
                                    1
                                  )
                                ],
                                1
                              )
                            ],
                            1
                          )
                        ],
                        1
                      )
                    : _vm._e()
                ],
                { variant: variant }
              )
            ],
            2
          ),
          _vm._v(" "),
          index < _vm.variants.length - 1
            ? _c("v-divider", { key: index, attrs: { inset: "" } })
            : _vm._e()
        ]
      })
    ],
    2
  )
}
var staticRenderFns = []
render._withStripped = true
module.exports = { render: render, staticRenderFns: staticRenderFns }
if (false) {
  module.hot.accept()
  if (module.hot.data) {
    require("vue-hot-reload-api")      .rerender("data-v-3aa4f50a", module.exports)
  }
}

/***/ })

});