//
//  YZPBaseModel.m
//  TheProject
//
//  Created by 袁志浦 on 16/5/28.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "YZPBaseModel.h"
@implementation YZPBaseModel

/*
 *替换key
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    NSDictionary *dict = @{@"ID":@"id",
                           @"des":@"description"};
    return dict;
}

/*
 *是否为空
 */
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if (oldValue == nil || [oldValue isKindOfClass:[NSNull class]]){
        return @"";
    }
    return oldValue;
}
/**
 归档的实现
 */
//MJExtensionCodingImplementation;

/**
 * 打印所有的属性
 */
MJExtensionLogAllProperties;

@end

//模型中有数组
/*

 + (NSDictionary *)mj_objectClassInArray
 {
 return @{
 @"statuses" : @"MJStatus",
 @"ads" : @"MJAd"
 };
 }
 */





