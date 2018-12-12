//
//  NSString+.m
//  Extension
//
//  Created by YuanZhiPu on 15/11/16.
//  Copyright © 2015年 NeiQuan. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)itemDisposeIdcardNumber{
    //星号字符串
    NSString *xinghaoStr = @"";
    //动态计算星号的个数
    for (int i  = 0; i < self.length - 7; i++) {
        xinghaoStr = [xinghaoStr stringByAppendingString:@"*"];
    }
    //身份证号取前3后四中间以星号拼接
    NSString *idcardNumberString = [NSString stringWithFormat:@"%@%@%@",[self substringToIndex:3],xinghaoStr,[self substringFromIndex:self.length-3]];
    //返回处理好的身份证号
    return idcardNumberString;
}

- (CGSize)returnSizeWittMaxSize:(CGSize )size textFont:(UIFont *)textFont{
    
    CGRect rect = [self  boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:textFont forKey:NSFontAttributeName] context:nil];
    return rect.size;
}

- (CGFloat)returnWidthFont:(UIFont *)textFont{
    
    NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:textFont,NSFontAttributeName,nil];
    CGSize size = [self sizeWithAttributes:dic];
    return size.width;
}

- (NSString *)encodedString{
    NSString *newUrlString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return newUrlString;
}

//通过url.query获取参数字符 再分成字典
- (NSMutableDictionary *)getURLParameters{
    if (!self.length) {
        return nil;
    }
    NSMutableDictionary *params = [NSMutableDictionary   dictionary];
    //id=1&name=Andy&age=20
    if ([self containsString:@"&"]) {
        NSArray *urlComponents = [self componentsSeparatedByString:@"&"];
        for (NSString *keyValuePair in urlComponents) {
            //生成key/value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString*value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            //key不能为nil
            if(key==nil|| value ==nil) continue;
            //设置值
            [params setValue:value forKey:key];
        }
    }
    return params;
}

- (BOOL)isNull{
    //  判断 字符串是否为 NULL 或者 nil
    if ([self isKindOfClass:[NSNull class]] || self == nil|| self == NULL||[self isEqualToString:@"<null>"]||[self isEqualToString:@"(null)"]) {
        return YES;
    }
    return NO;
}
@end
