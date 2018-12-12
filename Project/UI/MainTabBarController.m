//
//  MainTabBarController.m
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "MainTabBarController.h"

#import "HomeViewController.h"
#import "SweepViewController.h"
#import "MineViewController.h"
#import "SDTableViewController.h"

#import "AppDelegate+VC.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@property(nonatomic,strong)UIButton *centerButton;

@end

@implementation MainTabBarController

- (UIButton *)centerButton{
    if (_centerButton == nil) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerButton.frame = CGRectMake(self.tabBar.frame.size.width/2-30, -35, 60, 60);
        _centerButton.layer.cornerRadius = 30;
        _centerButton.layer.borderWidth = 5;
        _centerButton.layer.masksToBounds = YES;
        _centerButton.backgroundColor = [UIColor redColor];
        [_centerButton setImage:[UIImage imageNamed:@"play_hover"] forState:UIControlStateNormal];
        _centerButton.adjustsImageWhenHighlighted = NO;//去除按钮的按下效果（阴影）
        [_centerButton addTarget:self action:@selector(onLiveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.delegate = self;
    [self initTabbar];
    
}

- (void)initTabbar{

    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildViewControlWithTitle:@"首页" control:homeVC image:@"" selectedImage:@"" itemTag:0];
    
    UIViewController *noVC = [[UIViewController alloc] init];
    [self addChildViewControlWithTitle:@"扫一扫" control:noVC image:@"" selectedImage:@"" itemTag:1];

    MineViewController *userVC = [[MineViewController alloc] init];
    [self addChildViewControlWithTitle:@"我的" control:userVC image:@"" selectedImage:@"" itemTag:2];

    SDTableViewController *vc = [[SDTableViewController alloc] init];
    [self addChildViewControlWithTitle:@"SD" control:vc image:@"" selectedImage:@"" itemTag:3];

    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(self.centerButton.superview != nil){
        [self.centerButton removeFromSuperview];
    }
    [self.tabBar addSubview:self.centerButton];
}

- (void)onLiveButtonClicked{
    //在实际项目中进行更改
    UITabBarController *tabBarController = (UITabBarController *)MainWindow.rootViewController;
    UINavigationController *nav = (UINavigationController*)tabBarController.selectedViewController;
    
    UIViewController * fatherVC = nav.viewControllers[0];
    SweepViewController *publishVC = [[SweepViewController alloc] init];
    [fatherVC presentViewController:publishVC animated:YES completion:^{}];
    
}

- (void)addChildViewControlWithTitle:(NSString *)title control:(UIViewController *)control image:(NSString *)image selectedImage:(NSString *)selectedImage itemTag:(NSInteger)itemTag{
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:control];
    
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    nav.tabBarItem.title = title;
    
    nav.tabBarItem.tag = itemTag;
    //    [self.tabBar showBadgeOnItemIndex:0];
    //    [self.tabBar showBadgeOnItemIndex:3];
    
    [self addChildViewController:nav];
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    return index != 1;

}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (item.tag == 1) {
        [self onLiveButtonClicked];
    }
}
@end
