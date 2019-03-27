//
//  UIColor+Category.m
//  FunyAlley
//
//  Created by 袁志浦 on 2018/7/12.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor*)colorWithHEX:(long)hexValue{
    return [UIColor colorWithHEX:hexValue alpha:1];
}

+ (UIColor *)colorWithHEX:(long)hexValue alpha:(float)alpha{
    float red = ((float)((hexValue & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexValue & 0x00FF00) >> 8))/255.0;
    float blue = ((float)(hexValue & 0x0000FF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHEXString:(NSString *)hexString{
    return [UIColor colorWithHEXString:hexString alpha:1];
}

+ (UIColor *)colorWithHEXString:(NSString *)hexString alpha:(float)alpha{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *)randomColor{
    float R = (arc4random() % 256)/255.00;
    float G = (arc4random() % 256)/255.00;
    float B = (arc4random() % 256)/255.00;
    return [UIColor colorWithRed:R green:G blue:B alpha:1];
}

@end
