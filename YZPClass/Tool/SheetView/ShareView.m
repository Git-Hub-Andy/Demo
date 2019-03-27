//
//  ShareView.m
//  Test
//
//  Created by 袁志浦 on 2018/8/30.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

- (void)addContentView{
    [super addContentView];
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-100)/4;
    
    CGFloat height = width + 40;
    
    self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - height, [UIScreen mainScreen].bounds.size.width, height);
    self.contentView.backgroundColor = [UIColor redColor];
    
    for (int a = 0; a < 4; a++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(20 + (a%4)*(width+20), 20, width, width);
        button.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:button];
    }
    
}

@end
