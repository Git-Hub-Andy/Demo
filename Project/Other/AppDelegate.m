//
//  AppDelegate.m
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//
/*
 H5唤醒APP
 1.设置URL schemes（注意URL schemes对大小写不敏感）
 2.将URL schemes 加入白名单
 3.- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
   在这个方法中判断URL schemes做相应的处理 做界面的跳转
 */

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "NetWork.h"

#import "AdvertiseHelper.h"
#import "GuidePagesHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[MainTabBarController alloc] init];

    
    
//    [NetWork startWorkReachability];
    [self.window makeKeyAndVisible];
    
//    //引导页面加载
//    [self setupGuidePage];
//
//    //启动广告（记得放最后，才可以盖在页面上面）
//    [self setupAdveriseView];
    
    return YES;
}

#pragma mark 启动广告
- (void)setupAdveriseView{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}

#pragma mark 引导页
- (void)setupGuidePage
{
//    if ([ReadForLocation(IsNotFirstLaunch_Key) boolValue])
//    {
//        return;
//    }
//    WriteForLocation(@(YES), IsNotFirstLaunch_Key);
    NSArray *images = @[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
    [GuidePagesHelper showGuidePagesView:images];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
