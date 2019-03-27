//
//  WXApiManager.h
//  SDKSample
//
//  Created by Jeason on 16/07/2015.
//
//

#import <Foundation/Foundation.h>

#import "WXApi.h"
#import "WXApiObject.h"

@interface WXApiManager : NSObject<WXApiDelegate>

+ (instancetype)sharedManager;

@end
