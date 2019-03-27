//
//  NSObject+FMDB.h
//  FunyAlley
//
//  Created by 袁志浦 on 2018/9/14.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FMDBSQL)

+ (NSString *)cregateTable:(NSString *)tableName;

- (NSString *)installToTable:(NSString *)tableName;

+ (NSString *)deleteFromTable:(NSString *)tableName parameters:(NSDictionary *)parameters;

- (NSString *)updateTable:(NSString *)tableName parameters:(NSDictionary *)parameters;

+ (NSString *)selectTable:(NSString *)tableName parameters:(NSDictionary *)parameters;
@end
