//
//  NSDictionary+Category.h
//  Test
//
//  Created by 袁志浦 on 2018/8/31.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSDictionary (Category)

- (NSString *)keyForValue:(NSString *)value;

@end
