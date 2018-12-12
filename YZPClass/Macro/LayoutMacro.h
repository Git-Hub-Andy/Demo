//
//  LayoutMacro.h
//  ChengHuiGou
//
//  Created by 袁志浦 on 2016/11/17.
//  Copyright © 2016年 袁志浦. All rights reserved.
//

#ifndef LayoutMacro_h
#define LayoutMacro_h

//宽
#define Screen_Width      ([[UIScreen mainScreen] bounds].size.width)

//高
#define Screen_Height     ([[UIScreen mainScreen] bounds].size.height)

#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define NavHeight 44

#define TabBarHeight (StatusBarHeight > 20 ? 83 : 49)

#define TopHeight (StatusBarHeight + NavBarHeight) //整个导航栏高度

//判断是否是iphone5的设备
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否是iphone4的设备
#define iPhone4  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//=======================判断设备类型=======================


//不同屏幕尺寸字体适配（375.0，667.0是因为效果图为IPHONE6 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (Screen_Width/375.0)
#define kScreenHeightRatio (Screen_Height/667.0)

// floorl()----向下取整
#define AdaptedWidth(x)  floorf((x) * kScreenWidthRatio)

#define AdaptedHeight(x) floorf((x) * kScreenHeightRatio)

#define FontSize(fontSize)   [UIFont systemFontOfSize:(fontSize*kScreenWidthRatio)]

#define UITextViewEnable 1

#define UITextFieldEnable 1

#define UIButtonEnable 1

#define UILabelEnable 1

#define ISCustomFontName 1

#define CustomFontName @"FZLBJW--GB1-0"


#endif /* LayoutMacro_h */
