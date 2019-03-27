//
//  NSUserDefaults+Category.h
//  Project
//
//  Created by 袁志浦 on 2018/8/31.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Category)

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

+ (nullable id)objectForKey:(NSString *)defaultName;

+ (void)removeObjectForKey:(NSString *)defaultName;

+ (void)removeAllObject;

@end
