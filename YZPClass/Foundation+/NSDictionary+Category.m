//
//  NSDictionary+Category.m
//  Test
//
//  Created by 袁志浦 on 2018/8/31.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

+ (void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(em_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (void)em_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject && key) {
        [self em_setObject:emObject forKey:key];
    }else{
        NSString * string = [NSString stringWithFormat:@"%@ is nil ",key];
        NSAssert(emObject, string);
        //如果第一个参数不满足条件,就会记录和打印第二个参数
    }
}

- (NSString *)keyForValue:(NSString *)value{
    __block NSString *theKey;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqualToString:value]) {
            theKey = key;
        }
    }];
    return theKey;
}

@end
