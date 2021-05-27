"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _reactNative = require("react-native");

let VisaSensoryBranding;

if (_reactNative.Platform.OS === 'ios') {
  VisaSensoryBranding = _reactNative.NativeModules.JJJVisaSensoryBranding;
} else {
  VisaSensoryBranding = _reactNative.NativeModules.VisaSensoryBranding;
}

var _default = VisaSensoryBranding;
exports.default = _default;
//# sourceMappingURL=index.js.map