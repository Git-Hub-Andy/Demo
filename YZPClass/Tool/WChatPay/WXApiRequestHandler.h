//
//  WXApiManager.h
//  SDKSample
//
//  Created by Jeason on 15/7/14.
//
//

#import <Foundation/Foundation.h>

#import "WXApi.h"
#import "WXApiObject.h"

typedef void(^CallBackBlock)(PayResp *resp);

@interface WXApiRequestHandler : NSObject

+ (instancetype)sharedManager;

- (void)jumpPay:(NSDictionary *)dict standbyCallback:(CallBackBlock)callback;

@end
