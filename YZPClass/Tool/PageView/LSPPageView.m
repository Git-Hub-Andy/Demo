//
//  XPageView.m
//  PageViewDemo
//  https://github.com/MrLSPBoy/PageViewController
//  Created by Object on 17/7/11.
//  Copyright © 2017年 Object. All rights reserved.
//

#define TitleHeight 44

#import "LSPPageView.h"

@interface LSPPageView ()<LSPTitleViewDelegate,LSPContentViewDelegate>

/**
 标题类型
 */
@property(nonatomic, strong) LSPTitleStyle *style;

/**
 父控制器
 */
@property(nonatomic, weak) UIViewController *parentVc;
/**
 标题视图
 */
@property(nonatomic, strong) LSPTitleView *titleView;
/**
 内容视图
 */
@property(nonatomic, strong) LSPContentView *contentView;

@end

@implementation LSPPageView

- (LSPPageView *)initWithFrame:(CGRect)frame style:(LSPTitleStyle *)style parentVc:(UIViewController *)parentVc{
    
    if (self = [super initWithFrame:frame]) {

        self.style = style ? style : [[LSPTitleStyle alloc] init];

        self.parentVc = parentVc;
        
        parentVc.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

- (void)setTitles:(NSArray<NSString *> *)titles{
    CGRect titleFrame = CGRectMake(0, 0, self.frame.size.width, TitleHeight);
    self.titleView = [[LSPTitleView alloc] initWithFrame:titleFrame titles:titles style:self.style];
    self.titleView.delegate = self;
    [self addSubview:self.titleView];
}

- (void)setChildVcs:(NSArray<UIViewController *> *)childVcs{

    CGRect contentFrame = CGRectMake(0, TitleHeight, self.frame.size.width, self.frame.size.height - TitleHeight);
    self.contentView = [[LSPContentView alloc] initWithFrame:contentFrame childVcs:childVcs parentViewController:self.parentVc style:self.style];
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.contentView.delegate = self;
    [self addSubview:self.contentView];
}

#pragma mark - LSPTitleViewDelegate
- (void)titleView:(LSPTitleView *)titleView selectedIndex:(NSInteger)selectedIndex{
    [self.contentView setCurrentIndex:selectedIndex];
    
    if ([self.delegate respondsToSelector:@selector(pageViewScollEndView:WithIndex:)]){
        [self.delegate pageViewScollEndView:self WithIndex:selectedIndex];
    }
}

#pragma mark - LSPContentViewDelegate
- (void)contentView:(LSPContentView *)contentView progress:(CGFloat)progress sourceIndex:(CGFloat)sourceIndex targetIndex:(CGFloat)targetIndex{
    [self.titleView setTitleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}

- (void)contentViewEndScroll:(LSPContentView *)contentView{
    [self.titleView contentViewDidEndScroll];
}

- (void)scrollViewDidEndDeceleratingWithIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(pageViewScollEndView:WithIndex:)]){
        [self.delegate pageViewScollEndView:self WithIndex:index];
    }
}

@end
