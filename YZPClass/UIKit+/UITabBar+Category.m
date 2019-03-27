//
//  UITabBar+Category.m
//  TheProject
//
//  Created by 袁志浦 on 16/7/14.
//  Copyright © 2016年 北京惠发科技有限公司. All rights reserved.
//
#define TabbarItemNums 5.0    //tabbar的数量 如果是5个设置为5.0

#define BadgeViewTag 88888

#import "UITabBar+Category.h"

@implementation UITabBar (Category)

//显示小红点
- (void)showBadgeOnItemIndex:(int)index{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = BadgeViewTag + index;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    
    //确定小红点的位置
    float percentX = (index +0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * self.frame.size.width);
    CGFloat y = ceilf(0.1 * self.frame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
    [self addSubview:badgeView];
}
//隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}
//移除小红点
- (void)removeBadgeOnItemIndex:(int)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == BadgeViewTag+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
