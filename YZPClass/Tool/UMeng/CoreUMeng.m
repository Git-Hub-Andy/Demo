//
//  CoreUMengLogin.h
//  CoreUmeng
//
//  Created by 袁志浦 on 16/3/23.
//  Copyright © 2016年 YuanZhiPu. All rights reserved.
//

//  pod 'UMengSocialCOM', '~> 5.2.1'

#import "CoreUMeng.h"

@implementation CoreUMeng

+ (void)setupUMeng{
    
    [[UMSocialManager defaultManager] openLog:YES];
    //设置AppKey
    [[UMSocialManager defaultManager] setUmSocialAppkey:UmengAppKey];

    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAPPID appSecret:WXAPPsecret redirectURL:WXUrl];
    
    //设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAPPID  appSecret:QQAPPsecret redirectURL:QQUrl];
    
    //设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SinaAppKey  appSecret:SinaAPPsecret redirectURL:SinaUrl];
}

@end


@implementation CoreUMengLogin

+(void)login:(UMSocialPlatformType)loginType vc:(UIViewController *)vc resBlock:(void(^)(UMSocialUserInfoResponse *snsAccount,UMSocialPlatformType loginType))resBlock{
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:loginType currentViewController:vc completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *userInfo =result;
        NSLOG(@"%@",userInfo.originalResponse);
        NSString *message = [NSString stringWithFormat:@"openid:%@\n name: %@\n icon: %@\n gender: %@\n",userInfo.openid,userInfo.name,userInfo.iconurl,userInfo.gender];
        NSLOG(@"%@",message);
        
        if(!error){
            resBlock(userInfo,loginType);
        }

    }];
    
}

+ (void)cancelAuthWithPlatform:(UMSocialPlatformType)platForm resBlock:(void(^)(UMSocialUserInfoResponse *snsAccount,UMSocialPlatformType loginType))resBlock{
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:platForm completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *userinfo =result;
        NSString *message = [NSString stringWithFormat:@"name: %@\n icon: %@\n gender: %@\n",userinfo.name,userinfo.iconurl,userinfo.gender];
        NSLOG(@"%@",message);
        if (!error) {
            resBlock(userinfo,platForm);
        }
    }];
}

@end

@implementation CoreUMengShare

+(void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType content:(NSString *)content image:(UIImage *)image url:(NSString *)url successBlock:(void(^)(id))successBlock{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"微一微" descr:content thumImage:image];
    //设置网页地址
    shareObject.webpageUrl = url;
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            successBlock(data);
            NSLog(@"response data is %@",data);
        }
    }];
}

#pragma mark - 分享图片
+ (void)shareImageToPlatformType:(UMSocialPlatformType)platformType image:(id)image successBlock:(void(^)(id shareResponse))successBlock{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    [shareObject setShareImage:image];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
            successBlock(data);
        }
    }];
}
@end
