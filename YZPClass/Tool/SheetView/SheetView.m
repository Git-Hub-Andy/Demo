//
//  ShowView.m
//  Test
//
//  Created by 袁志浦 on 2018/8/30.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import "SheetView.h"

@interface SheetView ()

@property (nonatomic,strong) UIWindow *window;

@property (nonatomic,strong) UITapGestureRecognizer *gesture;

@property (nonatomic,strong) UIView *bgView;

@end

@implementation SheetView

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:self.window.bounds];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    }
    return _bgView;
}

- (UIWindow *)window{
    if (!_window) {
        _window = [UIApplication sharedApplication].keyWindow;
        [_window addGestureRecognizer:self.gesture];

    }
    return _window;
}

- (UITapGestureRecognizer *)gesture{
    if (!_gesture) {
        _gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    }
    return _gesture;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:nil]];
    }
    return _contentView;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self.bgView addSubview:self];
        [self.window addSubview:self.bgView];
    }
    return self;
}

#pragma mark 打开与关闭方法
-(void)show{
    __weak __typeof(self) weakSelf = self;

    self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self addContentView];

    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }];
}

- (void)close{
    __weak __typeof(self) weakSelf = self;
    [self.window removeGestureRecognizer:self.gesture];
    self.gesture = nil;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 206);
    } completion:^(BOOL finished) {
        [weakSelf.bgView removeFromSuperview];
    }];
}

- (void)addContentView{
    [self addSubview:self.contentView];

}

@end
