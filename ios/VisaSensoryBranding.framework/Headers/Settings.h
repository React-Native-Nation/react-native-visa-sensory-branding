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

typedef NS_ENUM(NSInteger, AnimationFlagDirection) {
    RIGHT,
    LEFT
};

@interface UIImage(Logo)
+ (UIImage *)logo;
@end

typedef NS_ENUM(NSInteger, Chime) {
    VSENSORYBRANDING
};


@interface Sound : NSObject
- (instancetype)initWithChime:(Chime)chime;
- (void)play;
@end

@interface UIColor(VisaColor)
+ (UIColor *)darkBlue;
+ (UIColor *)visaBlue;
@end

typedef NS_ENUM(NSInteger, Theme) {
    VISA_BRAND, // Visa Blue background
    WHITE, // White background
    OTHER // Custom color background
};

@interface ForegroundColors : NSObject
@property(nonatomic) Theme theme;
- initWithBackgroundColor:UIColor;
- (NSArray *)topFlagcolors;
- (NSArray *)bottomFlagColors;
- (UIColor *)logoColor;
- (UIColor *)checkMarkColor;
@end

@interface NSArray(CGColor)
- (NSArray *)cgColors;
@end
