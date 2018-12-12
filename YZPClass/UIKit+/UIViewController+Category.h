//
//  UIViewController+Extension.h
//  TheProject
//
//  Created by 袁志浦 on 16/5/28.
//  Copyright © 2016年 北京惠发科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(Category)

/** 设置导航条背景 */
-(void)setNavigationBarBackgroundImage:(NSString *)image;

/** 图片标题 */
-(void)setImageTitleViewWithFrame:(CGRect)frame image:(NSString *)image;

/** 选项卡标题 */
-(void)setSegmentTitleViewWithItems:(NSArray *)items action:(SEL)action;

/** 既有图标又有文字的左边按钮 */
-(void)setLeftBarButtonItemWithFrame:(CGRect)frame title:(NSString *)titile titleColor:(UIColor *)titleColor image:(NSString *)image imageInsets:(UIEdgeInsets)insets backImage:(NSString *)backImage selectBackImage:(NSString *)selectBackImage action:(SEL)action;

/** 只有图片的左边按钮 */
-(void)setLeftBarButtonWithImage:(NSString *)imageName action:(SEL)action;

/** 只有文字的左边按钮 */
-(void)setLetfBarButtonWithTitle:(NSString *)title action:(SEL)action;

/** 既有图标又有文字的左边按钮 */
-(void)setRightBarButtonItemWithFrame:(CGRect)frame title:(NSString *)titile titleColor:(UIColor *)titleColor image:(NSString *)image imageInsets:(UIEdgeInsets)insets backImage:(NSString *)backImage selectBackImage:(NSString *)selectBackImage action:(SEL)action;

/** 只有图片的右边按钮 */
-(void)setRightBarButtonWithImage:(NSString *)imageName action:(SEL)action;

/** 只有图片的右边按钮 */
-(void)setRightBarButtonWithTitle:(NSString *)title action:(SEL)action;

/**显示进度加文字*/
- (void)showMessage:(NSString *)message;

@end
