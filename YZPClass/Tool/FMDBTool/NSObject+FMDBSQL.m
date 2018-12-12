//
//  NSObject+FMDB.m
//  FunyAlley
//
//  Created by 袁志浦 on 2018/9/14.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import "NSObject+FMDBSQL.h"

@implementation NSObject (FMDBSQL)

+ (NSString *)cregateTable:(NSString *)tableName{
    u_int count;
    // 传递count的地址过去 &count
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    //arrayWithCapacity的效率稍微高那么一丢丢
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++){
        //此刻得到的propertyName为c语言的字符串
        const char* propertyName =property_getName(properties[i]);
        //此步骤把c语言的字符串转换为OC的NSString
        [propertiesArray addObject: [NSString stringWithUTF8String:propertyName]];
    }
    free(properties);
    
    NSMutableArray *propertiesType = [NSMutableArray array];
    for (NSString *properties in propertiesArray) {
        [propertiesType addObject:[NSString stringWithFormat:@"%@ text",properties]];
    }
    
    NSString *allString = [propertiesType componentsJoinedByString:@","];
    
    return [NSString stringWithFormat:@"CREATE TABLE %@ (%@)",tableName,allString];
}

- (NSString *)installToTable:(NSString *)tableName{

    NSMutableDictionary *modelDic = self.mj_keyValues;
    NSMutableArray *keyArray = [NSMutableArray array];
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *key in self.mj_keyValues) {
        [keyArray addObject:key];
        [valueArray addObject:[NSString stringWithFormat:@"\"%@\"",modelDic[key]]];
    }
    NSString *keyString = [keyArray componentsJoinedByString:@","];
    NSString *valueString = [valueArray componentsJoinedByString:@","];
    
    return [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)",tableName,keyString,valueString];
}

+ (NSString *)deleteFromTable:(NSString *)tableName parameters:(NSDictionary *)parameters{
    
    if (parameters.allKeys.count == 0) {
        return [NSString stringWithFormat:@"DELETE FROM %@",tableName];
    }else{
        NSMutableArray *parArray = [NSMutableArray array];
        for (NSString *key in parameters.allKeys) {
            NSString *s = [NSString stringWithFormat:@"%@=\"%@\"",key,parameters[key]];
            [parArray addObject:s];
        }
        NSString *parString = [parArray componentsJoinedByString:@" AND "];
        return [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@",tableName,parString];
    }
}

- (NSString *)updateTable:(NSString *)tableName parameters:(NSDictionary *)parameters{
    //UPDATE Person SET Address = 'Zhongshan 23', City = 'Nanjing' WHERE LastName = 'Wilson'
    NSMutableDictionary *modelDic = self.mj_keyValues;
    NSMutableArray *keyValueArray = [NSMutableArray array];
    for (NSString *key in modelDic) {
        NSString *s = [NSString stringWithFormat:@"%@ = \"%@\"",key,modelDic[key]];
        [keyValueArray addObject:s];
    }
    NSString *valueString = [keyValueArray componentsJoinedByString:@","];

    if (parameters.allKeys.count == 0) {
        return [NSString stringWithFormat:@"UPDATE %@ SET %@",tableName,valueString];
    }else{
        
        NSMutableArray *parArray = [NSMutableArray array];
        for (NSString *key in parameters) {
            NSString *s = [NSString stringWithFormat:@"%@ = \"%@\"",key,parameters[key]];
            [parArray addObject:s];
        }
        NSString *parString = [parArray componentsJoinedByString:@","];
        return [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@",tableName,valueString,parString];
    }
}

+ (NSString *)selectTable:(NSString *)tableName parameters:(NSDictionary *)parameters{

    if (parameters.allKeys.count == 0) {
        return [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    }else{
        NSMutableArray *parArray = [NSMutableArray array];
        for (NSString *key in parameters.allKeys) {
            NSString *s = [NSString stringWithFormat:@"%@=\"%@\"",key,parameters[key]];
            [parArray addObject:s];
        }
        NSString *parString = [parArray componentsJoinedByString:@" AND "];
        return [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@",tableName,parString];
    }
}

@end
