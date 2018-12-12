//
//  UIView+Category.h
//  TheProject
//
//  Created by 袁志浦 on 2016/11/17.
//  Copyright © 2016年 北京惠发科技有限公司. All rights reserved.
//

@interface UIView (MakeCornerRadius)

///边框半径
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
///边框颜色
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
///是否切为正圆
@property (nonatomic, assign) IBInspectable BOOL isRound;

@end

@interface UIView (Category)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGFloat left;
@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGFloat bottom;

@property (assign, nonatomic) CGSize  size;
@property (assign, nonatomic) CGPoint origin;

//@property (assign, nonatomic) CGRect  frame;

@end
