//
//  AA.h
//  FunyAlley
//
//  Created by 袁志浦 on 2018/9/14.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#define DBNAME @"cache.db"

#define DBPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES)[0] stringByAppendingPathComponent:DBNAME]

#import <Foundation/Foundation.h>
#import "NSObject+FMDBSQL.h"

@interface NSObject (FMDB)

+ (NSString *)tableName;

+ (FMDatabase*)getDB;

- (void)save;

+ (void)del:(NSDictionary *)parameters;

- (void)update:(NSDictionary *)parameters;

+ (NSMutableArray *)select:(NSDictionary *)parameters;
@end


