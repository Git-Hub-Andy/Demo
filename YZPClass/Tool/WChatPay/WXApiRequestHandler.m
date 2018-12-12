//
//  WXApiManager.m
//  SDKSample
//
//  Created by Jeason on 15/7/14.
//
//

#import "WXApiRequestHandler.h"

@interface WXApiRequestHandler()

@property(nonatomic,copy)CallBackBlock block;

@end

@implementation WXApiRequestHandler
#pragma mark - LifeCycle
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static WXApiRequestHandler *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXApiRequestHandler alloc] init];
    });
    return instance;
}

- (void)jumpPay:(NSDictionary *)dict standbyCallback:(CallBackBlock)callback{
    
    _block = callback;

    //调起微信支付
    PayReq *req   = [[PayReq alloc] init];
    req.partnerId = [dict objectForKey:@"partnerid"];
    req.prepayId  = [dict objectForKey:@"prepayid"];
    req.nonceStr  = [dict objectForKey:@"noncestr"];
    req.timeStamp = [dict[@"timestamp"] intValue];
    req.package   = [dict objectForKey:@"package"];
    req.sign      = [dict objectForKey:@"sign"];
    [WXApi sendReq:req];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payStateAction:) name:@"PayStateNotification" object:nil];
}

- (void)payStateAction:(NSNotification *)notifiaction{
    PayResp *resp = notifiaction.object;    
    _block(resp);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
