webpackJsonp([3],{

/***/ 204:
/***/ (function(module, exports, __webpack_require__) {

var disposed = false
function injectStyle (ssrContext) {
  if (disposed) return
  __webpack_require__(205)
}
var normalizeComponent = __webpack_require__(18)
/* script */
var __vue_script__ = __webpack_require__(207)
/* template */
var __vue_template__ = __webpack_require__(208)
/* template functional */
var __vue_template_functional__ = false
/* styles */
var __vue_styles__ = injectStyle
/* scopeId */
var __vue_scopeId__ = "data-v-15805eb3"
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
Component.options.__file = "resources/js/components/AddVariantForm.vue"

/* hot reload */
if (false) {(function () {
  var hotAPI = require("vue-hot-reload-api")
  hotAPI.install(require("vue"), false)
  if (!hotAPI.compatible) return
  module.hot.accept()
  if (!module.hot.data) {
    hotAPI.createRecord("data-v-15805eb3", Component.options)
  } else {
    hotAPI.reload("data-v-15805eb3", Component.options)
  }
  module.hot.dispose(function (data) {
    disposed = true
  })
})()}

module.exports = Component.exports


/***/ }),

/***/ 205:
/***/ (function(module, exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(206);
if(typeof content === 'string') content = [[module.i, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var update = __webpack_require__(17)("18bf521e", content, false, {});
// Hot Module Replacement
if(false) {
 // When the styles change, update the <style> tags
 if(!content.locals) {
   module.hot.accept("!!../../../node_modules/css-loader/index.js!../../../node_modules/vue-loader/lib/style-compiler/index.js?{\"vue\":true,\"id\":\"data-v-15805eb3\",\"scoped\":true,\"hasInlineConfig\":true}!../../../node_modules/vue-loader/lib/selector.js?type=styles&index=0!./AddVariantForm.vue", function() {
     var newContent = require("!!../../../node_modules/css-loader/index.js!../../../node_modules/vue-loader/lib/style-compiler/index.js?{\"vue\":true,\"id\":\"data-v-15805eb3\",\"scoped\":true,\"hasInlineConfig\":true}!../../../node_modules/vue-loader/lib/selector.js?type=styles&index=0!./AddVariantForm.vue");
     if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
     update(newContent);
   });
 }
 // When the module is disposed, remove the <style> tags
 module.hot.dispose(function() { update(); });
}

/***/ }),

/***/ 206:
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(2)(false);
// imports


// module
exports.push([module.i, "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", ""]);

// exports


/***/ }),

/***/ 207:
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
  name: 'AddVariantForm',
  model: {
    event: 'input',
    prop: 'value'
  },
  props: {
    value: {
      type: Boolean,
      default: false
    },
    title: {
      type: String,
      default: '完成采购明细'
    },
    edit: {
      type: Boolean,
      default: false
    }
  },
  data: function data() {
    return {
      currentAddVariant: {
        provider: null,
        offerPrice: 0,
        price: 0,
        pcs: 0,
        variant: null
      }
    };
  },

  watch: {
    'currentAddVariant.provider': function currentAddVariantProvider(val) {
      if (val && this.currentAddVariant.offerPrice === 0) {
        this.currentAddVariant.offerPrice = val.pivot.price;
      }
    },
    'currentAddVariant.variant': function currentAddVariantVariant(val) {
      if (val) {
        this.currentAddVariant.price = val.price;
      }
    }
  },
  methods: {
    setShow: function setShow(value) {
      this.$emit('input', value);
    },
    save: function save() {
      this.$emit('procurement-plan-save-variant', this.currentAddVariant);
    },
    initForm: function initForm() {
      this.currentAddVariant = {
        provider: null,
        offerPrice: 0,
        price: 0,
        pcs: 0,
        variant: null
      };
    }
  },
  computed: {
    selectBind: function selectBind() {
      return this.edit ? { hint: '编辑模式下无法改变供应商，如需改变请删除该记录重新添加', persistentHint: true, readonly: this.edit } : {};
    }
  },
  mounted: function mounted() {
    var _this = this;

    Nova.$on('procurement-plan-edit-variant', function (current) {
      _this.initForm();
      _this.currentAddVariant = Object.assign({}, _this.currentAddVariant, current);
    });
  },
  destroyed: function destroyed() {
    Nova.$off('procurement-plan-edit-variant');
  }
});

/***/ }),

/***/ 208:
/***/ (function(module, exports, __webpack_require__) {

var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "v-layout",
    { attrs: { row: "", "justify-center": "" } },
    [
      _c(
        "v-dialog",
        {
          attrs: { persistent: "", "max-width": "500px" },
          model: {
            value: _vm.value,
            callback: function($$v) {
              _vm.value = $$v
            },
            expression: "value"
          }
        },
        [
          _vm.currentAddVariant.variant
            ? _c(
                "v-card",
                [
                  _c("v-progress-linear", {
                    staticClass: "my-0",
                    attrs: { value: 50, height: "3" }
                  }),
                  _vm._v(" "),
                  _c(
                    "v-card-title",
                    { attrs: { "primary-title": "" } },
                    [
                      _c(
                        "v-layout",
                        { attrs: { column: "" } },
                        [
                          _c(
                            "v-flex",
                            [
                              _c("div", { staticClass: "headline" }, [
                                _vm._v(_vm._s(_vm.title))
                              ]),
                              _vm._v(" "),
                              _c("div", [
                                _vm._v(
                                  "SKU: " +
                                    _vm._s(_vm.currentAddVariant.variant.sku)
                                )
                              ]),
                              _vm._v(" "),
                              _c("v-divider"),
                              _vm._v(" "),
                              _c("div", { staticClass: "grey--text" }, [
                                _vm._v(
                                  "添加 " +
                                    _vm._s(
                                      _vm.currentAddVariant.variant.name +
                                        " " +
                                        _vm.currentAddVariant.variant
                                          .attribute_key
                                    ) +
                                    "\n                        "
                                )
                              ])
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
                  _c(
                    "v-card-text",
                    [
                      _c(
                        "v-container",
                        { attrs: { "grid-list-md": "" } },
                        [
                          _c(
                            "v-layout",
                            { attrs: { wrap: "" } },
                            [
                              _c(
                                "v-flex",
                                [
                                  _c("input", {
                                    directives: [
                                      {
                                        name: "model",
                                        rawName: "v-model.trim",
                                        value: _vm.currentAddVariant.price,
                                        expression: "currentAddVariant.price",
                                        modifiers: { trim: true }
                                      }
                                    ],
                                    attrs: { readonly: "", required: "" },
                                    domProps: {
                                      value: _vm.currentAddVariant.price
                                    },
                                    on: {
                                      input: function($event) {
                                        if ($event.target.composing) {
                                          return
                                        }
                                        _vm.$set(
                                          _vm.currentAddVariant,
                                          "price",
                                          $event.target.value.trim()
                                        )
                                      },
                                      blur: function($event) {
                                        _vm.$forceUpdate()
                                      }
                                    }
                                  }),
                                  _vm._v(" "),
                                  _c(
                                    "v-select",
                                    _vm._b(
                                      {
                                        directives: [
                                          {
                                            name: "validate",
                                            rawName: "v-validate",
                                            value: "required",
                                            expression: "'required'"
                                          }
                                        ],
                                        attrs: {
                                          items:
                                            _vm.currentAddVariant.variant
                                              .providers.data,
                                          label: "供应商",
                                          "item-text": function(item) {
                                            return item.name
                                          },
                                          "item-value": function(item) {
                                            return item
                                          },
                                          "no-data-text":
                                            "该商品目前暂无供应商",
                                          "error-messages": _vm.errors.first(
                                            "provider"
                                          ),
                                          name: "provider",
                                          required: ""
                                        },
                                        scopedSlots: _vm._u([
                                          {
                                            key: "item",
                                            fn: function(ref) {
                                              var item = ref.item
                                              return [
                                                _c(
                                                  "v-list-tile-avatar",
                                                  {
                                                    staticClass:
                                                      "headline font-weight-light white--text",
                                                    attrs: {
                                                      size: "36",
                                                      color: "indigo"
                                                    }
                                                  },
                                                  [
                                                    _vm._v(
                                                      "\n                                        " +
                                                        _vm._s(
                                                          item.name.charAt(0)
                                                        ) +
                                                        "\n                                    "
                                                    )
                                                  ]
                                                ),
                                                _vm._v(" "),
                                                _c(
                                                  "v-list-tile-content",
                                                  [
                                                    _c("v-list-tile-title", {
                                                      domProps: {
                                                        innerHTML: _vm._s(
                                                          item.name
                                                        )
                                                      }
                                                    }),
                                                    _vm._v(" "),
                                                    _c(
                                                      "v-list-tile-sub-title",
                                                      {
                                                        domProps: {
                                                          innerHTML: _vm._s(
                                                            item.description
                                                          )
                                                        }
                                                      }
                                                    )
                                                  ],
                                                  1
                                                ),
                                                _vm._v(" "),
                                                _c("v-list-tile-action-text", [
                                                  _vm._v(
                                                    "报价: " +
                                                      _vm._s(item.pivot.price)
                                                  )
                                                ])
                                              ]
                                            }
                                          }
                                        ]),
                                        model: {
                                          value: _vm.currentAddVariant.provider,
                                          callback: function($$v) {
                                            _vm.$set(
                                              _vm.currentAddVariant,
                                              "provider",
                                              $$v
                                            )
                                          },
                                          expression:
                                            "currentAddVariant.provider"
                                        }
                                      },
                                      "v-select",
                                      _vm.selectBind,
                                      false
                                    )
                                  ),
                                  _vm._v(" "),
                                  _vm.currentAddVariant.provider
                                    ? _c("input", {
                                        directives: [
                                          {
                                            name: "model",
                                            rawName: "v-model.trim",
                                            value:
                                              _vm.currentAddVariant.offerPrice,
                                            expression:
                                              "currentAddVariant.offerPrice",
                                            modifiers: { trim: true }
                                          }
                                        ],
                                        attrs: {
                                          label: "采购价",
                                          hint:
                                            "系统默认会提取供应商报价，不过这里需要你输入实际采购价格",
                                          required: ""
                                        },
                                        domProps: {
                                          value:
                                            _vm.currentAddVariant.offerPrice
                                        },
                                        on: {
                                          input: function($event) {
                                            if ($event.target.composing) {
                                              return
                                            }
                                            _vm.$set(
                                              _vm.currentAddVariant,
                                              "offerPrice",
                                              $event.target.value.trim()
                                            )
                                          },
                                          blur: function($event) {
                                            _vm.$forceUpdate()
                                          }
                                        }
                                      })
                                    : _vm._e(),
                                  _vm._v(" "),
                                  _c("input", {
                                    directives: [
                                      {
                                        name: "model",
                                        rawName: "v-model.number",
                                        value: _vm.currentAddVariant.pcs,
                                        expression: "currentAddVariant.pcs",
                                        modifiers: { number: true }
                                      }
                                    ],
                                    attrs: {
                                      label: "采购数量",
                                      name: "pcs",
                                      required: ""
                                    },
                                    domProps: {
                                      value: _vm.currentAddVariant.pcs
                                    },
                                    on: {
                                      input: function($event) {
                                        if ($event.target.composing) {
                                          return
                                        }
                                        _vm.$set(
                                          _vm.currentAddVariant,
                                          "pcs",
                                          _vm._n($event.target.value)
                                        )
                                      },
                                      blur: function($event) {
                                        _vm.$forceUpdate()
                                      }
                                    }
                                  })
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
                  ),
                  _vm._v(" "),
                  _c(
                    "v-card-actions",
                    [
                      _c("v-spacer"),
                      _vm._v(" "),
                      _c(
                        "v-btn",
                        {
                          attrs: { color: "grey lighten-1", flat: "" },
                          nativeOn: {
                            click: function($event) {
                              _vm.setShow(false)
                            }
                          }
                        },
                        [_vm._v("关闭\n                ")]
                      ),
                      _vm._v(" "),
                      _c(
                        "v-btn",
                        {
                          attrs: { color: "primary", flat: "" },
                          nativeOn: {
                            click: function($event) {
                              return _vm.save($event)
                            }
                          }
                        },
                        [_vm._v("保存\n                ")]
                      )
                    ],
                    1
                  )
                ],
                1
              )
            : _vm._e()
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true
module.exports = { render: render, staticRenderFns: staticRenderFns }
if (false) {
  module.hot.accept()
  if (module.hot.data) {
    require("vue-hot-reload-api")      .rerender("data-v-15805eb3", module.exports)
  }
}

/***/ })

});