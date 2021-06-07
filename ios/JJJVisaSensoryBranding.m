#import "JJJVisaSensoryBranding.h"

@implementation JJJVisaSensoryBranding

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(show,
                 options: (NSDictionary *)options
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL soundEnabled = options[@"soundEnabled"] && [options[@"soundEnabled"] boolValue];
        BOOL constrainedFlags = options[@"constrainedFlags"] && [options[@"constrainedFlags"] boolValue];
        BOOL checkMarkShown = options[@"checkMarkShown"] && [options[@"checkMarkShown"] boolValue];
        BOOL hapticFeedbackEnabled = options[@"hapticFeedbackEnabled"] && [options[@"hapticFeedbackEnabled"] boolValue];
        
        int red = 0;
        int green = 0;
        int blue = 0;
        sscanf([options[@"backdropColor"] UTF8String], "#%02X%02X%02X", &red, &green, &blue);
        UIColor *backdropColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
        
        SensoryBrandingView *sensoryView = [[SensoryBrandingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        sensoryView.center =  CGPointMake([UIScreen mainScreen].bounds.size.width /2, [UIScreen mainScreen].bounds.size.height / 2);
        
        sensoryView.isSoundEnabled = soundEnabled;
        sensoryView.backdropColor = backdropColor;
        sensoryView.hasConstrainedFlags = constrainedFlags;
        sensoryView.isCheckmarkShown = checkMarkShown;
        sensoryView.isHapticFeedbackEnabled = hapticFeedbackEnabled;
        sensoryView.backgroundColor = [UIColor greenColor];

        UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        overlayView.backgroundColor = backdropColor;
        [overlayView addSubview:sensoryView];
    
       [[UIApplication sharedApplication].keyWindow addSubview:overlayView];

       [sensoryView animateWithCompletionHandler:^(NSError * _Nullable error) {
           NSNumber *result = @(1);
           [overlayView removeFromSuperview];
           resolve(result);
       }];
        
    });
}

@end
