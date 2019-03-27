//
//  UIColor+Category.h
//  FunyAlley
//
//  Created by 袁志浦 on 2018/7/12.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithHEX:(long)hexValue;

+ (UIColor *)colorWithHEX:(long)hexValue alpha:(float)alpha;

+ (UIColor *)colorWithHEXString:(NSString *)hexString;

+ (UIColor *)colorWithHEXString:(NSString *)hexString alpha:(float)alpha;

+ (UIColor *)randomColor;

@end
