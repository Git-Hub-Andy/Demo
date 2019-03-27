//
//  UIButton+Category.h
//  TheProject
//
//  Created by 袁志浦 on 16/7/15.
//  Copyright © 2016年 北京惠发科技有限公司. All rights reserved.
//

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
