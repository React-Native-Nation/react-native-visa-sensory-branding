import { NativeModules, Platform } from 'react-native';

type VisaSensoryBrandingType = {
};

let VisaSensoryBranding;
if(Platform.OS === 'ios'){
  VisaSensoryBranding = NativeModules['JJJVisaSensoryBranding'];
} else {
  VisaSensoryBranding = NativeModules['VisaSensoryBranding'];
}


export default VisaSensoryBranding as VisaSensoryBrandingType;
