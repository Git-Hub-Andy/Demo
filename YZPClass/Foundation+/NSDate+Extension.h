
#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  将当前日期转化为日期字符串
 *
 *  @return 日期字符串
 */
- (NSString*)returnDateString;

/**
 *  当前日期转换为时间戳 (日期转换为秒数)
 *
 *  @return 返回时间戳字符串
 */
+ (NSString *)returnSecond;

/**
 *   时间戳转化日期字符串
 *
 *  @param secondString 时间戳
 *
 *  @param formatter 日期格式
 *  @return 返回一个日期字符串
 */
+ (NSString *)dateWithSecond:(long long)secondString formatter:(NSString *)formatter;

/**
 *  日期字符串转时间戳
 *
 *  @param dataString    日期字符串
 *  @param dataFormatter 日期格式
 *
 *  @return 返回时间戳
 */
+ (long)returnSecondWithDataString:(NSString *)dataString dataFormatter:(NSString *)dataFormatter;

/**
 *  指定的时间戳距离今天多久(包括时分秒)
 *
 *  @param time 时间戳
 *
 *  @return 字符串
 */
+ (NSString *)timeStringWithInterval:(NSTimeInterval)time;
@end
