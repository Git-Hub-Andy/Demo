//
//  ShowView.h
//  Test
//
//  Created by 袁志浦 on 2018/8/30.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheetView : UIView

@property (nonatomic,strong) UIView *contentView;

- (void)addContentView;

- (void)show;

- (void)close;

@end
