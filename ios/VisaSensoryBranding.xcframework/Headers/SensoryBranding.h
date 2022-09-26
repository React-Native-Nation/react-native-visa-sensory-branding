/**
 * VISA CONFIDENTIAL
 * __________________
 *
 *  © Copyright 2018 Visa. All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Visa and its suppliers and affiliates.  The intellectual and technical concepts contained
 * herein are proprietary to Visa and its suppliers and affiliates
 * and may be covered by U.S. and foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information, reproduction or use of this material
 * is strictly forbidden unless (a) in support of Visa products, programs and services provided through the VDP platform or (b) if prior written permission is obtained from Visa. Any permitted use pursuant to (a) or (b) is subject to the VDP Terms of Use. THIS MATERIAL IS PROVIDED ON AN “AS IS,” “AS AVAILABLE,” “WITH ALL FAULTS” BASIS WITHOUT WARRANTY OF ANY KIND. YOUR USE IS AT YOUR OWN RISK.
 */

#import <UIKit/UIKit.h>
#import "Settings.h"

/**
 The Visa Sensory Branding gives users meaningful confirmation of their payment.
 
 Apply this animation only when the user has selected a Visa card to make payment, and play it
 after the user has submitted their payment credentials or when a transaction is complete.
 */
@interface SensoryBrandingView : UIView

/**
 The color behind the animation, used to determine the Visa logo and Flag colors. Specify Visa Blue(#15195A) for a white Visa logo with gradient blue/yellow flags.
 Specify White(#FFFFFF) for a blue Visa logo with solid blue/yellow flags. Any other color will result in either blue or white color applied to both Logo and Flags, depending on contrast.
 For convenience, we have included a color property for the Visa Blue mentioned above.
 
 Note: Do not set backdropColor to clear, will default to Visa Blue if done so.
 */
@property(nonatomic, nonnull) UIColor *backdropColor;

/**
 The Visa Flags are the animated bars that transition above and below the Visa logo. Set to true to use constrained flags.
 */
@property(nonatomic) BOOL hasConstrainedFlags;

/**
 Set to true to enable sound.
 */
@property(nonatomic) BOOL isSoundEnabled;

/**
 Set to true to enable haptic feedback.
 */
@property(nonatomic) BOOL isHapticFeedbackEnabled;

/**
 Set to true to show a confirmation check at end of animation.
 */
@property(nonatomic) BOOL isCheckmarkShown;

/**
 Activates the Visa Sensory Branding animation.
 */
- (void)animate;

/**
 Activates the Visa Sensory Branding animation, using completion handler to notify caller once animation is finished.
 */
- (void)animateWithCompletionHandler:(void (^_Nonnull)(NSError * _Nullable error))completionHandler;

@end
