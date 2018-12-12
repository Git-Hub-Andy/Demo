//
//  NSURL+Category.h
//  FunyAlley
//
//  Created by 袁志浦 on 2018/8/29.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Category)

- (NSDictionary *)queryParams;

- (NSURL *)urlWithParameters:(NSDictionary *)parameters;

@end
