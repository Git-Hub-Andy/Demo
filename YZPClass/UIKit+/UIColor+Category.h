
#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithHEX:(long)hexValue;

+ (UIColor *)colorWithHEX:(long)hexValue alpha:(float)alpha;

+ (UIColor *)colorWithHEXString:(NSString *)hexString;

+ (UIColor *)colorWithHEXString:(NSString *)hexString alpha:(float)alpha;

+ (UIColor *)randomColor;

@end
