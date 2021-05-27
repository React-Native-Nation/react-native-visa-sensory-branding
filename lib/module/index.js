import { NativeModules, Platform } from 'react-native';
let VisaSensoryBranding;

if (Platform.OS === 'ios') {
  VisaSensoryBranding = NativeModules.JJJVisaSensoryBranding;
} else {
  VisaSensoryBranding = NativeModules.VisaSensoryBranding;
}

export default VisaSensoryBranding;
//# sourceMappingURL=index.js.map