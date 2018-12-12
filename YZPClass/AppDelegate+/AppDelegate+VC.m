//
//  AppDelegate+VC.m
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "AppDelegate+VC.h"

@implementation AppDelegate (VC)

+ (instancetype)sharedAppDelegate{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

+ (UIAlertController *)showAlert:(UIViewController *)rootVC title:(NSString *)title message:(NSString *)msg okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle ok:(ActionHandle)succ cancel:(ActionHandle)fail{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    if (cancelTitle){
        [alert addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:fail]];
    }
    if (okTitle){
        [alert addAction:[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:succ]];
    }
    [rootVC presentViewController:alert animated:YES completion:nil];
    return alert;
}

- (void)pushViewController:(UIViewController *)viewController{
    @autoreleasepool{
        viewController.hidesBottomBarWhenPushed = YES;
        [[AppDelegate navigationViewController] pushViewController:viewController animated:NO];
    }
}

- (UIViewController *)popViewController{
    return [[AppDelegate navigationViewController] popViewControllerAnimated:YES];
}

- (NSArray *)popToRootViewController{
    return [[AppDelegate navigationViewController] popToRootViewControllerAnimated:NO];
}

- (NSArray *)popToViewController:(UIViewController *)viewController{
    return [[AppDelegate navigationViewController] popToViewController:viewController animated:YES];
}

// 获取当前活动的navigationcontroller
+ (UINavigationController *)navigationViewController{
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    if ([window.rootViewController isKindOfClass:[UINavigationController class]]){
        return (UINavigationController *)window.rootViewController;
    }else if ([window.rootViewController isKindOfClass:[UITabBarController class]]){
        UIViewController *selectVc = [((UITabBarController *)window.rootViewController) selectedViewController];
        if ([selectVc isKindOfClass:[UINavigationController class]]){
            return (UINavigationController *)selectVc;
        }
    }
    return nil;
}

+ (UIViewController *)visibleVC {
    UINavigationController *nav = nil;
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    if ([window.rootViewController isKindOfClass:[UINavigationController class]]){
        nav = (UINavigationController *)window.rootViewController;
        return nav.topViewController;
    }else if ([window.rootViewController isKindOfClass:[UITabBarController class]]){
        UIViewController *selectVc = [((UITabBarController *)window.rootViewController) selectedViewController];
        if ([selectVc isKindOfClass:[UINavigationController class]]){
            nav = (UINavigationController *)(UINavigationController *)selectVc;
            return nav.topViewController;
        }
    }
    return nil;
}
@end
