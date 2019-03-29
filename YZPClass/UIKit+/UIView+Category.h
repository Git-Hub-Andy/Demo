
#import <UIKit/UIKit.h>

@interface UIView (MakeCornerRadius)

///边框半径
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
///边框颜色
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
///是否切为正圆
@property (nonatomic, assign) IBInspectable BOOL isRound;

@end

@interface UIView (Category)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGFloat left;
@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGFloat bottom;

@property (assign, nonatomic) CGSize  size;
@property (assign, nonatomic) CGPoint origin;

//@property (assign, nonatomic) CGRect  frame;

@end
