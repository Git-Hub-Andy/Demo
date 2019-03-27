//
//  UITabBar+Category.h
//  TheProject
//
//  Created by 袁志浦 on 16/7/14.
//  Copyright © 2016年 北京惠发科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Category)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
