//
//  XTitleStyle.m
//  PageViewDemo
//  https://github.com/MrLSPBoy/PageViewController
//  Created by Object on 17/7/11.
//  Copyright © 2017年 Object. All rights reserved.
//

#import "LSPTitleStyle.h"

@implementation LSPTitleStyle

- (instancetype)init{
    if (self = [super init]) {
        
        self.isTitleViewScrollEnable = YES;
        self.isContentViewScrollEnable = YES;
        self.normalColor = [UIColor blackColor];
        self.selectedColor = [UIColor colorWithRed:((float)((0x2EC4D3 & 0xFF0000) >> 16))/255.0 green:((float)((0x2EC4D3 & 0x00FF00) >> 8))/255.0 blue:((float)(0x2EC4D3 & 0x0000FF))/255.0 alpha:1.0];
        self.font = [UIFont systemFontOfSize:14.0];
        self.titleMargin = 0.0;
        self.isShowBottomLine = YES;
        self.bottomLineColor = [UIColor orangeColor];
        self.bottomLineH = 2.0;
        self.isNeedScale = NO;
        self.scaleRange = 1.2;
        self.isShowCover = NO;
        self.coverBgColor = [UIColor yellowColor];
        self.coverMargin = 0.0;
        self.coverH = 25.0;
        self.coverRadius = 5;
        self.bottomLineW = 20;
        self.selectIndex = 0;
    }
    return self;
}

@end
