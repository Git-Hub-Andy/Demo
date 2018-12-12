//
//  NSString+.h
//  Extension
//
//  Created by YuanZhiPu on 15/11/16.
//  Copyright © 2015年 NeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)
/**
 *  对身份证号进行处理
 *
 *  @return 带*的字符串
 */
- (NSString *)itemDisposeIdcardNumber;

- (CGSize)returnSizeWittMaxSize:(CGSize)size textFont:(UIFont *)textFont;

- (CGFloat)returnWidthFont:(UIFont *)textFont;

/*
 *  对字符串进行编码
 */
- (NSString *)encodedString;

//通过url.query获取参数字符 再分成字典
- (NSMutableDictionary *)getURLParameters;

- (BOOL)isNull;
@end
