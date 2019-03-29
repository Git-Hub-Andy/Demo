
#import "UIViewController+Category.h"

@implementation UIViewController(Category)

/** 设置导航条背景 */
-(void)setNavigationBarBackgroundImage:(NSString *)image{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:image] forBarMetrics:UIBarMetricsDefault];
}

/** 图片标题 */
-(void)setImageTitleViewWithFrame:(CGRect)frame image:(NSString *)image{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    self.navigationItem.titleView = imageView;
}

/** 选项卡标题 */
-(void)setSegmentTitleViewWithItems:(NSArray *)items action:(SEL)action{
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:items];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:action forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
}

/** 既有图标又有文字的左边按钮 */
-(void)setLeftBarButtonItemWithFrame:(CGRect)frame title:(NSString *)titile titleColor:(UIColor *)titleColor image:(NSString *)image imageInsets:(UIEdgeInsets)insets backImage:(NSString *)backImage selectBackImage:(NSString *)selectBackImage action:(SEL)action{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = frame;
    [leftButton setTitle:titile forState:UIControlStateNormal];
    [leftButton setTitleColor:titleColor forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    leftButton.imageEdgeInsets = insets;
    [leftButton setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:selectBackImage] forState:UIControlStateHighlighted];
    leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:10];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}
/** 只有图片的左边按钮 */
-(void)setLeftBarButtonWithImage:(NSString *)imageName action:(SEL)action{
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

/** 只有文字的左边按钮 */
-(void)setLetfBarButtonWithTitle:(NSString *)title action:(SEL)action{
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

/** 既有图标又有文字的右边按钮 */
-(void)setRightBarButtonItemWithFrame:(CGRect)frame title:(NSString *)titile titleColor:(UIColor *)titleColor image:(NSString *)image imageInsets:(UIEdgeInsets)insets backImage:(NSString *)backImage selectBackImage:(NSString *)selectBackImage action:(SEL)action{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = frame;
    [rightButton setTitle:titile forState:UIControlStateNormal];
    [rightButton setTitleColor:titleColor forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    rightButton.imageEdgeInsets = insets;
    [rightButton setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:selectBackImage] forState:UIControlStateHighlighted];
    rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}
/** 只有图片的右边按钮 */
-(void)setRightBarButtonWithImage:(NSString *)imageName action:(SEL)action{
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

/** 只有文字的右边按钮 */
-(void)setRightBarButtonWithTitle:(NSString *)title action:(SEL)action{
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}

/**显示成功提示*/
- (void)showMessage:(NSString *)message{
//    [self.view showToastMsg:message];
}
@end
