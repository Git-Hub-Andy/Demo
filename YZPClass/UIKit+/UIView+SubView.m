
#import "UIView+SubView.h"
#import <objc/runtime.h>

#import "UILabel+Compute.h"

#define kBackGroudAlpha 0.6

#define kBackGroudColor [UIColor colorWithWhite:0.0 alpha:kBackGroudAlpha]

#define CornerRadius  5

#define kTime 2.2

#define kToastVertMargin 14

#define kToastMaxMargin 20

#define kToastLabelInset 20

//字体
#define kFont [UIFont boldSystemFontOfSize:16.0]


//线的默认高度
#define kLine_W_H_Default 0.7

//tag
#define kEffectView_Tag 5001    //毛玻璃tag

#define kTopLine_Tag    6001    //顶线tag
#define kLeftLine_Tag   6002    //左线tag
#define kBottomLine_Tag 6003    //底线tag
#define kRightLine_Tag  6004    //右线tag

static void *loadingViewKey = &loadingViewKey;
static void *errorViewKey   = &errorViewKey;
static void *toastViewKey   = &toastViewKey;

@implementation UIView (SubView)

#pragma mark - setter getter
//加载视图的setter
- (void)setLoadingView:(UIActivityIndicatorView *)loadingView
{
    objc_setAssociatedObject(self, &loadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN);
}

//加载视图的getter
- (UIView *)loadingView
{
    return  objc_getAssociatedObject(self, &loadingViewKey);
}


//错误视图的setter
- (void)setErrorView:(UIImageView *)errorView
{
    objc_setAssociatedObject(self, &errorViewKey, errorView, OBJC_ASSOCIATION_RETAIN);
}

//错误视图的getter
- (UIImageView *)errorView
{
    return  objc_getAssociatedObject(self, &errorViewKey);
}


//吐丝视图的setter
- (void)setToastView:(UIView *)toastView
{
    objc_setAssociatedObject(self, &toastViewKey, toastView, OBJC_ASSOCIATION_RETAIN);
}

//吐丝视图的getter
- (UIView *)toastView
{
    return  objc_getAssociatedObject(self, &toastViewKey);
}

#pragma mark - custom method
#pragma mark - 加载视图
//展示加载视图
- (void)showLoadingView
{
    self.loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:self.loadingView];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.center = CGPointMake(self.loadingView.bounds.size.width / 2.0, self.loadingView.bounds.size.height / 2.0);  //放在中心
    activityView.tag = 999;
    [self.loadingView addSubview:activityView];
    
    [activityView startAnimating];
    [self bringSubviewToFront:self.loadingView];
    
    if ([self isKindOfClass:[UIScrollView class]])
    {
        ((UIScrollView *)self).scrollEnabled = NO;
    }
}

//让加载视图消失
- (void)dismissLoadingView
{
    UIActivityIndicatorView *activityView = [self.loadingView viewWithTag:999];
    [activityView stopAnimating];
    
    [activityView removeFromSuperview];
    activityView = nil;
    
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
    
    if ([self isKindOfClass:[UIScrollView class]])
    {
        ((UIScrollView *)self).scrollEnabled = YES;
    }
}

#pragma mark - 错误视图
//展示错误视图
- (void)showErrorViewWithImage:(UIImage *)image
{
    if (!self.errorView)
    {
        self.errorView = [[UIImageView alloc] init];
        [self addSubview:self.errorView];
    }
    self.errorView.frame = self.bounds;
    self.errorView.image = image;
    [self bringSubviewToFront:self.errorView];
}

//让错误视图消失
- (void)dismissErrorView
{
    UIView *effectView = [self.errorView viewWithTag:1002];
    [effectView removeFromSuperview];
    
    [self.errorView removeFromSuperview];
    self.errorView = nil;
}

#pragma mark - 吐丝视图
//展示吐丝
- (void)showToastMsg:(NSString *)msg time:(CGFloat)time{
    [self dismissToast];
    
    self.toastView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:self.toastView];
    
    //创建需要的毛玻璃特效类型
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //毛玻璃view 视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.tag = 1002;
    effectView.layer.cornerRadius = CornerRadius;
    effectView.layer.masksToBounds = YES;
    //添加到要有毛玻璃特效的控件中
    //effectView.frame = self.bounds;
    //设置模糊透明度
    //effectView.alpha = 1.0f;
    
    UILabel *toastLabel = [[UILabel alloc] init];
//    toastLabel.contentInset = UIEdgeInsetsMake(kToastVertMargin, kToastLabelInset, kToastVertMargin, kToastLabelInset);
    //toastLabel.backgroundColor = kBackGroudColor;
    toastLabel.layer.cornerRadius = CornerRadius;
    toastLabel.layer.masksToBounds = YES;
    toastLabel.tag = 1001;
    toastLabel.font = kFont;
    
    toastLabel.textAlignment = NSTextAlignmentCenter;
    toastLabel.numberOfLines = 0;
    toastLabel.textColor = [UIColor whiteColor];
    [self.toastView addSubview:effectView];
    [effectView.contentView addSubview:toastLabel];
    
    toastLabel.text = msg;
    
    //计算文字的宽度
    CGFloat width = [toastLabel getWidth] + 2 * kToastLabelInset;
    CGFloat maxWidth = self.bounds.size.width - 2 * kToastMaxMargin;
    
    BOOL isSingleLine = (width <= maxWidth);
    
    CGFloat labelWidth = isSingleLine ? width : maxWidth;
    
    CGRect tempFrame = toastLabel.frame;
    
    CGSize textSize = [toastLabel getSizeWithWidth:labelWidth - 2 * kToastLabelInset];
    tempFrame.size = CGSizeMake(labelWidth, textSize.height + 2 * kToastVertMargin);
    
    //toastLabel.frame = tempFrame;
    effectView.frame = tempFrame;
    toastLabel.frame = effectView.bounds;
    
    effectView.center = CGPointMake(self.toastView.bounds.size.width / 2.0, self.toastView.bounds.size.height / 2.0);
    //	//加阴影
    //	view.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    //	view.layer.shadowOffset = CGSizeMake(0, 3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    //	view.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    //	view.layer.shadowRadius = 2;//阴影半径，默认3
    
//    toastLabel.text = msg;
//
    __weak __typeof(self)weakSelf = self;
    effectView.alpha = 0;
    effectView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:kBackGroudAlpha];
    [UIView animateWithDuration:0.3 animations:^{
        
        effectView.alpha = 0.99;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:time animations:^{
        
            effectView.alpha = 1;
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                
                effectView.alpha = 0.5;
                
            } completion:^(BOOL finished) {
               
                [weakSelf dismissToast];
            }];
        }];
    }];
    
    [self bringSubviewToFront:self.toastView];
}

- (void)showToastMsg:(NSString *)msg
{
    [self showToastMsg:msg time:kTime];
}

//让吐丝消息
- (void)dismissToast
{
    [self.toastView removeFromSuperview];
    self.toastView = nil;
}

#pragma mark - 毛玻璃视图
//插入毛玻璃视图 在视图底部
- (void)showEffectViewWithStyle:(UIBlurEffectStyle)style
                          alpha:(CGFloat)alpha
{
    UIVisualEffectView *effectView;
    effectView = [self viewWithTag:kEffectView_Tag];
    if (!effectView)
    {
        //创建需要的毛玻璃特效类型
        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:style];
        //毛玻璃view 视图
        effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        effectView.tag = kEffectView_Tag;
        //添加到要有毛玻璃特效的控件中
        effectView.frame = self.bounds;
        //设置模糊透明度
        effectView.alpha = alpha;
        [self insertSubview:effectView atIndex:0];
    }
}

//移除毛玻璃视图
- (void)dismissEffectView{
    UIVisualEffectView *effectView = [self viewWithTag:kEffectView_Tag];
    [effectView removeFromSuperview];
    effectView = nil;
}


#pragma mark - 添加线
#pragma mark - -添加顶线-
//默认：LineLayoutStyleInside
- (void)addTopLine
{
    [self addTopLineWithColor:kLine_Color_Default height:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addTopLineWithColor:(UIColor *)color
{
    [self addTopLineWithColor:color height:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addTopLineWithHeight:(CGFloat)height
{
    [self addTopLineWithColor:kLine_Color_Default height:height style:LineLayoutStyleInside];
}

- (void)addTopLineWithColor:(UIColor *)color height:(CGFloat)height
{
    [self addTopLineWithColor:color height:height style:LineLayoutStyleInside];
}

- (void)addTopLineWithStyle:(LineLayoutStyle)style
{
    [self addTopLineWithColor:kLine_Color_Default height:kLine_W_H_Default style:style];
}

- (void)addTopLineWithColor:(UIColor *)color style:(LineLayoutStyle)style
{
    [self addTopLineWithColor:color height:kLine_W_H_Default style:style];
}

- (void)addTopLineWithHeight:(CGFloat)height style:(LineLayoutStyle)style
{
    [self addTopLineWithColor:kLine_Color_Default height:height style:style];
}

- (void)addTopLineWithColor:(UIColor *)color height:(CGFloat)height style:(LineLayoutStyle)style
{
    UIView *lineView = [self viewWithTag:kTopLine_Tag];
    if (lineView)
    {
        return;
    }
    
    lineView = [UIView new];
    lineView.tag = kTopLine_Tag;
    lineView.backgroundColor = color;
    
    CGFloat topLayoutNum = 0;
    
    if (style == LineLayoutStyleMiddle)
    {
        topLayoutNum = -height / 2.0;
    }
    else if (style == LineLayoutStyleOutside)
    {
        topLayoutNum = -height;
    }
    
    if ([self isKindOfClass:[UIScrollView class]])
    {
        if (self.frame.size.height != 0 && self.frame.size.height != 0)
        {
            [self addSubview:lineView];
            [self bringSubviewToFront:lineView];
            
            lineView.frame = CGRectMake(0, topLayoutNum, self.frame.size.width, height);
        }
        
        return;
    }
    
    [self addSubview:lineView];
    [self bringSubviewToFront:lineView];
    
    //添加约束
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:height]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:topLayoutNum]];
}

#pragma mark - -添加左线-
- (void)addLeftLine
{
    [self addLeftLineWithColor:kLine_Color_Default width:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addLeftLineWithColor:(UIColor *)color
{
    [self addLeftLineWithColor:color width:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addLeftLineWithWidth:(CGFloat)width
{
    [self addLeftLineWithColor:kLine_Color_Default width:width style:LineLayoutStyleInside];
}

- (void)addLeftLineWithColor:(UIColor *)color width:(CGFloat)width
{
    [self addLeftLineWithColor:color width:width style:LineLayoutStyleInside];
}

- (void)addLeftLineWithStyle:(LineLayoutStyle)style
{
    [self addLeftLineWithColor:kLine_Color_Default width:kLine_W_H_Default style:style];
}

- (void)addLeftLineWithColor:(UIColor *)color style:(LineLayoutStyle)style
{
    [self addLeftLineWithColor:color width:kLine_W_H_Default style:style];
}

- (void)addLeftLineWithWidth:(CGFloat)width style:(LineLayoutStyle)style
{
    [self addLeftLineWithColor:kLine_Color_Default width:width style:style];
}

- (void)addLeftLineWithColor:(UIColor *)color width:(CGFloat)width style:(LineLayoutStyle)style{
    UIView *lineView = [self viewWithTag:kLeftLine_Tag];
    if (lineView)
    {
        return;
    }
    
    lineView = [UIView new];
    lineView.tag = kLeftLine_Tag;
    lineView.backgroundColor = color;
    
    
    CGFloat leftLayoutNum = 0;
    
    if (style == LineLayoutStyleMiddle)
    {
        leftLayoutNum = -width / 2.0;
    }
    else if (style == LineLayoutStyleOutside)
    {
        leftLayoutNum = -width;
    }
    
    if ([self isKindOfClass:[UIScrollView class]])
    {
        if (self.frame.size.height != 0 && self.frame.size.height != 0)
        {
            [self addSubview:lineView];
            [self bringSubviewToFront:lineView];
            
            
            lineView.frame = CGRectMake(leftLayoutNum, 0, width, CGRectGetHeight(self.frame));
        }
        
        return;
    }
    
    [self addSubview:lineView];
    [self bringSubviewToFront:lineView];
    
    //添加约束
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:width]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:leftLayoutNum]];
}

- (void)addLeftLineWithColor:(UIColor *)color width:(CGFloat)width margin:(CGFloat)margin style:(LineLayoutStyle)style
{
    UIView *lineView = [self viewWithTag:kLeftLine_Tag];
    if (lineView)
    {
        return;
    }
    
    lineView = [UIView new];
    lineView.tag = kLeftLine_Tag;
    lineView.backgroundColor = color;
    
    CGFloat leftLayoutNum = 0;
    
    if (style == LineLayoutStyleMiddle)
    {
        leftLayoutNum = -width / 2.0;
    }
    else if (style == LineLayoutStyleOutside)
    {
        leftLayoutNum = -width;
    }
    
    if ([self isKindOfClass:[UIScrollView class]])
    {
        if (self.frame.size.height != 0 && self.frame.size.height != 0)
        {
            [self addSubview:lineView];
            [self bringSubviewToFront:lineView];
            
            lineView.frame = CGRectMake(leftLayoutNum, 0, width, CGRectGetHeight(self.frame));
        }
        
        return;
    }
    
    [self addSubview:lineView];
    [self bringSubviewToFront:lineView];
    
    //添加约束
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:margin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-margin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:width]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:leftLayoutNum]];
}

#pragma mark - -添加底线-
- (void)addBottomLine
{
    [self addBottomLineWithColor:kLine_Color_Default height:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addBottomLineWithColor:(UIColor *)color
{
    [self addBottomLineWithColor:color height:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addBottomLineWithHeight:(CGFloat)height
{
    [self addBottomLineWithColor:kLine_Color_Default height:height style:LineLayoutStyleInside];
}

- (void)addBottomLineWithColor:(UIColor *)color height:(CGFloat)height
{
    [self addBottomLineWithColor:color height:height style:LineLayoutStyleInside];
}

- (void)addBottomLineWithStyle:(LineLayoutStyle)style
{
    [self addBottomLineWithColor:kLine_Color_Default height:kLine_W_H_Default style:style];
}

- (void)addBottomLineWithColor:(UIColor *)color style:(LineLayoutStyle)style
{
    [self addBottomLineWithColor:color height:kLine_W_H_Default style:style];
}

- (void)addBottomLineWithHeight:(CGFloat)height style:(LineLayoutStyle)style
{
    [self addBottomLineWithColor:kLine_Color_Default height:height style:style];
}

- (void)addBottomLineWithColor:(UIColor *)color height:(CGFloat)height style:(LineLayoutStyle)style;
{
    UIView *lineView = [self viewWithTag:kBottomLine_Tag];
    if (lineView)
    {
        return;
    }
    
    lineView = [UIView new];
    lineView.tag = kBottomLine_Tag;
    lineView.backgroundColor = color;
    
    CGFloat bottomLayoutNum = 0;
    
    if (style == LineLayoutStyleMiddle){
        bottomLayoutNum = height / 2.0;
    }else if (style == LineLayoutStyleOutside){
        bottomLayoutNum = height;
    }
    
    if ([self isKindOfClass:[UIScrollView class]]){
        if (self.frame.size.height != 0 && self.frame.size.height != 0){
            [self addSubview:lineView];
            [self bringSubviewToFront:lineView];
            
            lineView.frame = CGRectMake(0, CGRectGetHeight(self.frame) + bottomLayoutNum - height, CGRectGetWidth(self.frame), height);
        }
        
        return;
    }
    
    [self addSubview:lineView];
    [self bringSubviewToFront:lineView];
    
    //添加约束
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:bottomLayoutNum]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:height]];
}

#pragma mark - -添加右线-
- (void)addRightLine
{
    [self addRightLineWithColor:kLine_Color_Default width:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addRightLineWithColor:(UIColor *)color
{
    [self addRightLineWithColor:color width:kLine_W_H_Default style:LineLayoutStyleInside];
}

- (void)addRightLineWithWidth:(CGFloat)width
{
    [self addRightLineWithColor:kLine_Color_Default width:width style:LineLayoutStyleInside];
}

- (void)addRightLineWithColor:(UIColor *)color width:(CGFloat)width
{
    [self addRightLineWithColor:color width:width style:LineLayoutStyleInside];
}

- (void)addRightLineWithStyle:(LineLayoutStyle)style
{
    [self addRightLineWithColor:kLine_Color_Default width:kLine_W_H_Default style:style];
}

- (void)addRightLineWithColor:(UIColor *)color style:(LineLayoutStyle)style
{
    [self addRightLineWithColor:color width:kLine_W_H_Default style:style];
}

- (void)addRightLineWithWidth:(CGFloat)width style:(LineLayoutStyle)style
{
    [self addRightLineWithColor:kLine_Color_Default width:width style:style];
}

- (void)addRightLineWithColor:(UIColor *)color width:(CGFloat)width style:(LineLayoutStyle)style
{
    
    UIView *lineView = [self viewWithTag:kRightLine_Tag];
    if (lineView)
    {
        return;
    }
    
    lineView = [UIView new];
    lineView.tag = kRightLine_Tag;
    lineView.backgroundColor = color;
    
    CGFloat rightLayoutNum = 0;
    
    if (style == LineLayoutStyleMiddle)
    {
        rightLayoutNum = width / 2.0;
    }
    else if (style == LineLayoutStyleOutside)
    {
        rightLayoutNum = width;
    }
    
    if ([self isKindOfClass:[UIScrollView class]])
    {
        if (self.frame.size.height != 0 && self.frame.size.height != 0)
        {
            [self addSubview:lineView];
            [self bringSubviewToFront:lineView];
            
            lineView.frame = CGRectMake(self.frame.size.width +  rightLayoutNum - width, 0, width, self.frame.size.height);
        }
        
        return;
    }
    
    
    [self addSubview:lineView];
    [self bringSubviewToFront:lineView];
    
    //添加约束
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:width]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:rightLayoutNum]];
}

@end
