//
//  CoreUMengLogin.h
//  CoreUmeng
//
//  Created by 袁志浦 on 16/3/23.
//  Copyright © 2016年 YuanZhiPu. All rights reserved.
//
/*
 <key>LSApplicationQueriesSchemes</key>
 <array>
 <!-- 微信 URL Scheme 白名单-->
 <string>wechat</string>
 <string>weixin</string>
 
 <!-- 新浪微博 URL Scheme 白名单-->
 <string>sinaweibohd</string>
 <string>sinaweibo</string>
 <string>sinaweibosso</string>
 <string>weibosdk</string>
 <string>weibosdk2.5</string>
 
 <!-- QQ、Qzone、TIM URL Scheme 白名单-->
 <string>mqqapi</string>
 <string>mqq</string>
 <string>mqqOpensdkSSoLogin</string>
 <string>mqqconnect</string>
 <string>mqqopensdkdataline</string>
 <string>mqqopensdkgrouptribeshare</string>
 <string>mqqopensdkfriend</string>
 <string>mqqopensdkapi</string>
 <string>mqqopensdkapiV2</string>
 <string>mqqopensdkapiV3</string>
 <string>mqqopensdkapiV4</string>
 <string>mqzoneopensdk</string>
 <string>wtloginmqq</string>
 <string>wtloginmqq2</string>
 <string>mqqwpa</string>
 <string>mqzone</string>
 <string>mqzonev2</string>
 <string>mqzoneshare</string>
 <string>wtloginqzone</string>
 <string>mqzonewx</string>
 <string>mqzoneopensdkapiV2</string>
 <string>mqzoneopensdkapi19</string>
 <string>mqzoneopensdkapi</string>
 <string>mqqbrowser</string>
 <string>mttbrowser</string>
 <string>tim</string>
 <string>timapi</string>
 <string>timopensdkfriend</string>
 <string>timwpa</string>
 <string>timgamebindinggroup</string>
 <string>timapiwallet</string>
 <string>timOpensdkSSoLogin</string>
 <string>wtlogintim</string>
 <string>timopensdkgrouptribeshare</string>
 <string>timopensdkapiV4</string>
 <string>timgamebindinggroup</string>
 <string>timopensdkdataline</string>
 <string>wtlogintimV1</string>
 <string>timapiV1</string>
 
 <!-- 支付宝 URL Scheme 白名单-->
 <string>alipay</string>
 <string>alipayshare</string>
 
 </array>
 
 */

#define UmengAppKey @"581feb38717c197b2b002d14"

#define WXAPPID @"wx6d39fd614da6d6d5"
#define WXAPPsecret @"93aad6f282fd9296b7e3d5960636bb04"
#define WXUrl @"http://www.weiwei.net"

#define SinaAppKey @"1913505474"
#define SinaAPPsecret @"052c68397a7cbc02cccc7b18898cbf1a"
#define SinaUrl @"www.sina.com"

#define QQAPPID @"1105783256"
#define QQAPPsecret @"DnIz6px7pmoVsvnP"
#define QQUrl @"www.qq.com"


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialCore.h>

@interface CoreUMeng : NSObject

+ (void)setupUMeng;

@end


@interface CoreUMengLogin : NSObject

+(void)login:(UMSocialPlatformType)loginType vc:(UIViewController *)vc resBlock:(void(^)(UMSocialUserInfoResponse *snsAccount,UMSocialPlatformType loginType))resBlock;

+ (void)cancelAuthWithPlatform:(UMSocialPlatformType)platForm resBlock:(void(^)(UMSocialUserInfoResponse *snsAccount,UMSocialPlatformType loginType))resBlock;

@end


@interface CoreUMengShare : NSObject

+(void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType content:(NSString *)content image:(UIImage *)image url:(NSString *)url successBlock:(void(^)(id))successBlock;

#pragma mark - 分享图片
+ (void)shareImageToPlatformType:(UMSocialPlatformType)platformType image:(id)image successBlock:(void(^)(id shareResponse))successBlock;
@end
