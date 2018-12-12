//
//  AA.m
//  FunyAlley
//
//  Created by 袁志浦 on 2018/9/14.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import "NSObject+FMDB.h"

@implementation NSObject (FMDB)

MJLogAllIvars

+ (NSString *)tableName{
    return @"";
}

+ (FMDatabase*)getDB{
    NSLog(@"===%@===",DBPATH);
    FMDatabase *db = [FMDatabase databaseWithPath:DBPATH];
    if ([db open]) {
        if (![db tableExists:[self tableName]]) {
            if ([db executeUpdate:[self cregateTable:[self tableName]]]) {
                NSLog(@"create table success");
            }else{
                NSLog(@"fail to create table");
            }
        }else {
            NSLog(@"table is already exist");
        }
    }else{  
        NSLog(@"fail to open");
    }
    return db;
}

- (void)save{
    
    FMDatabase *db = [self.class getDB];

    if ([db executeUpdate:[self installToTable:[self.class tableName]]]) {
        NSLog(@"插入成功");
    }else{
        NSLog(@"插入失败");
    }
    [db close];
}

+ (void)del:(NSDictionary *)parameters{
    FMDatabase *db = [self getDB];
    
    if ([db executeUpdate:[self deleteFromTable:[self tableName] parameters:parameters]]) {
        NSLog(@"delete successed");
    }else{
        NSLog(@"fail to delete");
    }
    [db close];
}

- (void)update:(NSDictionary *)parameters{
    FMDatabase *db = [self.class getDB];
    
    if ([db executeUpdate:[self updateTable:[self.class tableName] parameters:parameters]]) {
        NSLog(@"update successed");
    }else{
        NSLog(@"fail to update");
    }
    [db close];
    
}

+ (NSMutableArray *)select:(NSDictionary *)parameters{
    NSMutableArray *resultArray = [NSMutableArray array];
    
    FMDatabase *db = [self getDB];
    
    FMResultSet *rs = [db executeQuery:[self selectTable:[self tableName] parameters:parameters]];
    while ([rs next]) {
        [resultArray addObject:[self setValueWithFMResultSet:rs]];
    }
    return resultArray;
}

//给model属性赋值
+ (id)setValueWithFMResultSet:(FMResultSet *)rs{
    id model = [[self alloc] init];
    if (model){
        unsigned int count = 0;
        //获取类的属性列表
        Ivar *ivars = class_copyIvarList(self, &count);
        //给属性赋值
        for (int i = 0; i<count; i++){
            Ivar ivar = ivars[i];
            //获取变量名称(带_)
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];

            //生成setter方法
            NSString *usefullStr = [key substringFromIndex:1];
            //跳过下划线
            key = usefullStr.capitalizedString;
            
            //大写首字母
            key = [NSString stringWithFormat:@"set%@:", key];           //拼接set方法字符串
            SEL setSel = NSSelectorFromString(key);
            //调用setter方法
            if ([model respondsToSelector:setSel]){
                id value = [rs stringForColumn:usefullStr];
                [model performSelectorOnMainThread:setSel withObject:value waitUntilDone:[NSThread isMainThread]];
            }
        }
        free(ivars);
    }
    return model;
}

@end
