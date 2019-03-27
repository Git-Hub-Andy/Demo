//
//  AppDelegate+VC.h
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "AppDelegate.h"

typedef void (^ActionHandle)(UIAlertAction *action);

@interface AppDelegate (VC)

+ (instancetype)sharedAppDelegate;

+ (UIAlertController *)showAlert:(UIViewController *)rootVC title:(NSString *)title message:(NSString *)msg okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle ok:(ActionHandle)succ cancel:(ActionHandle)fail;

+ (UINavigationController *)navigationViewController;

- (NSArray *)popToRootViewController;

- (UIViewController *)popViewController;

- (NSArray *)popToViewController:(UIViewController *)viewController;

- (void)pushViewController:(UIViewController *)viewController;

+ (UIViewController *)visibleVC;
@end
