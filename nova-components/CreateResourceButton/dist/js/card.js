!function(e){var t={};function o(n){if(t[n])return t[n].exports;var r=t[n]={i:n,l:!1,exports:{}};return e[n].call(r.exports,r,r.exports,o),r.l=!0,r.exports}o.m=e,o.c=t,o.d=function(e,t,n){o.o(e,t)||Object.defineProperty(e,t,{configurable:!1,enumerable:!0,get:n})},o.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return o.d(t,"a",t),t},o.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},o.p="",o(o.s=1)}([function(e,t){e.exports=function(e,t,o,n,r,a){var s,u=e=e||{},i=typeof e.default;"object"!==i&&"function"!==i||(s=e,u=e.default);var c,l="function"==typeof u?u.options:u;if(t&&(l.render=t.render,l.staticRenderFns=t.staticRenderFns,l._compiled=!0),o&&(l.functional=!0),r&&(l._scopeId=r),a?(c=function(e){(e=e||this.$vnode&&this.$vnode.ssrContext||this.parent&&this.parent.$vnode&&this.parent.$vnode.ssrContext)||"undefined"==typeof __VUE_SSR_CONTEXT__||(e=__VUE_SSR_CONTEXT__),n&&n.call(this,e),e&&e._registeredComponents&&e._registeredComponents.add(a)},l._ssrRegister=c):n&&(c=n),c){var d=l.functional,h=d?l.render:l.beforeCreate;d?(l._injectStyles=c,l.render=function(e,t){return c.call(t),h(e,t)}):l.beforeCreate=h?[].concat(h,c):[c]}return{esModule:s,exports:u,options:l}}},function(e,t,o){o(2),e.exports=o(9)},function(e,t,o){Nova.booting(function(e,t){e.component("create-resource-button",o(3))})},function(e,t,o){var n=o(0)(o(4),o(8),!1,null,null,null);e.exports=n.exports},function(e,t,o){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=o(5),r=o.n(n);t.default={extends:r.a,data:function(){return{customCreateButton:null}},computed:{shouldShowCustomCreateButton:function(){return!!this.customCreateButton},buttonName:function(){return _.get(this,"customCreateButton.name",this.singularName)}},mounted:function(){this.customCreateButton=_.get(Nova,"config.customCreateResourceButtonConfig."+this.resourceName,null)}}},function(e,t,o){var n=o(0)(o(6),o(7),!1,null,null,null);e.exports=n.exports},function(e,t,o){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={props:{classes:{default:"btn btn-default btn-primary"},singularName:{},resourceName:{},viaResource:{},viaResourceId:{},viaRelationship:{},relationshipType:{},authorizedToCreate:{},authorizedToRelate:{}},computed:{shouldShowButtons:function(){return this.shouldShowAttachButton||this.shouldShowCreateButton},shouldShowAttachButton:function(){return("belongsToMany"==this.relationshipType||"morphToMany"==this.relationshipType)&&this.authorizedToRelate},shouldShowCreateButton:function(){return this.authorizedToCreate&&this.authorizedToRelate}}}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,o=e._self._c||t;return e.shouldShowButtons?o("div",[e.shouldShowAttachButton?o("router-link",{class:e.classes,attrs:{dusk:"attach-button",tag:"button",to:{name:"attach",params:{resourceName:e.viaResource,resourceId:e.viaResourceId,relatedResourceName:e.resourceName},query:{viaRelationship:e.viaRelationship,polymorphic:"morphToMany"==e.relationshipType?"1":"0"}}}},[e._t("default",[e._v("\n            "+e._s(e.__("Attach"))+" "+e._s(e.singularName)+"\n        ")])],2):e.shouldShowCreateButton?o("router-link",{class:e.classes,attrs:{tag:"button",dusk:"create-button",to:{name:"create",params:{resourceName:e.resourceName},query:{viaResource:e.viaResource,viaResourceId:e.viaResourceId,viaRelationship:e.viaRelationship}}}},[e._v("\n        "+e._s(e.__("Create"))+" "+e._s(e.singularName)+"\n    ")]):e._e()],1):e._e()},staticRenderFns:[]}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",[e.shouldShowButtons?o("span",{staticClass:"ml-auto"},[e.shouldShowAttachButton?o("router-link",{class:e.classes,attrs:{dusk:"attach-button",tag:"button",to:{name:"attach",params:{resourceName:e.viaResource,resourceId:e.viaResourceId,relatedResourceName:e.resourceName},query:{viaRelationship:e.viaRelationship,polymorphic:"morphToMany"==e.relationshipType?"1":"0"}}}},[e._t("default",[e._v("\n            "+e._s(e.__("Attach"))+" "+e._s(e.singularName)+"\n        ")])],2):e.shouldShowCreateButton?o("router-link",{class:e.classes,attrs:{tag:"button",dusk:"create-button",to:{name:"create",params:{resourceName:e.resourceName},query:{viaResource:e.viaResource,viaResourceId:e.viaResourceId,viaRelationship:e.viaRelationship}}}},[e._v("\n        "+e._s(e.__("Create"))+" "+e._s(e.singularName)+"\n    ")]):e._e()],1):e._e(),e._v(" "),e.shouldShowCustomCreateButton?o("span",{staticClass:"ml-auto"},[o("router-link",{class:e.classes,attrs:{tag:"button",dusk:"create-button",to:e.customCreateButton.url}},[e._v("\n        "+e._s(e.__("Create"))+" "+e._s(e.buttonName)+"\n    ")])],1):e._e()])},staticRenderFns:[]}},function(e,t){}]);