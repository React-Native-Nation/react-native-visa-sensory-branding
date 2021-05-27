#import "JJJVisaSensoryBranding.h"

@implementation JJJVisaSensoryBranding
 


RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(show,
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        SensoryBrandingView * sensoryView;
        sensoryView = [[SensoryBrandingView alloc] initWithFrame:CGRectMake(100,100, 500, 400)];
        sensoryView.isSoundEnabled = true;
        //sensoryView.backdropColor = [UIColor grayColor];
        sensoryView.hasConstrainedFlags = true;
        sensoryView.isCheckmarkShown = true;
        sensoryView.isHapticFeedbackEnabled = true;
        sensoryView.autoresizesSubviews = true;
        sensoryView.contentMode = 0;
        // sensoryView.backgroundColor = [UIColor redColor];
        
        UIView *container = [UIView new];
        container.backgroundColor = [UIColor blackColor];
        container.autoresizesSubviews = true;
        [container addSubview:sensoryView];
        
        UIViewController *sensoryViewController = [UIViewController new];
        sensoryViewController.view = container;
        sensoryViewController.title = @"as";
        sensoryViewController.automaticallyAdjustsScrollViewInsets = true;
        sensoryViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
  
       // UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
      //  [rootViewController presentViewController:sensoryViewController animated:YES completion:nil];
       // [sensoryView animate];
        
        UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            [((UINavigationController *)rootViewController) pushViewController:sensoryViewController animated:YES];
        } else {
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:sensoryViewController];
            [rootViewController presentViewController:navigationController animated:YES completion:nil];
        }
        
       [sensoryView animateWithCompletionHandler:^(NSError * _Nullable error) {
           NSNumber *result = @(1);
           if ([rootViewController isKindOfClass:[UINavigationController class]]) {
               [((UINavigationController *)rootViewController) popViewControllerAnimated:YES];
           } else {
               [rootViewController dismissViewControllerAnimated:YES completion:nil];
           }
           resolve(result);
       }];
        
    });
}

@end
