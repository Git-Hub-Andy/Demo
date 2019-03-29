
#import <UIKit/UIKit.h>

@interface UIButton (Category)

/*
 *设置热区
 */
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

/*
 *发送验证码
 */
- (void)setTime:(int)time;

@end
