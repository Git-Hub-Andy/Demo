
#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString*)returnDateString{
    static NSDateFormatter* formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    NSString *dateString = [formatter stringFromDate:self];
    return dateString;
}

+ (NSString *)returnSecond{
    NSDate *date = [NSDate date];
    NSTimeInterval timeStamp= [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%d",(int)timeStamp ];
}

+ (NSString *)dateWithSecond:(long long)second formatter:(NSString *)formatter{
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:second];
    //创建一个格式化器
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    //设置格式化的格式  2014年12月26日
    //@"yyyy-MM-dd HH:mm:ss"
    [dateFormatter setDateFormat:formatter];
    NSString * dateString = [dateFormatter stringFromDate:date2];
    NSLog(@"时间戳转日期 %lld  = %@", second, date2);

    return dateString;
}

+ (long)returnSecondWithDataString:(NSString *)dataString dataFormatter:(NSString *)dataFormatter{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dataFormatter];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:dataString]; //------------将字符串按formatter转成nsdate
    NSLog(@"%f",    date.timeIntervalSinceNow);
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    return (long)[date timeIntervalSince1970];
//    //    时间戳转时间的方法
//    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:(long)[date timeIntervalSince1970]];
//    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
//    NSLog(@"confromTimespStr =  %@",confromTimespStr);

}

+ (NSString *)timeStringWithInterval:(NSTimeInterval)time{
    
    long int distance = [[NSDate date] timeIntervalSince1970] - time;
    NSString *string;
    if (distance < 1){//avoid 0 seconds
        string = @"刚刚";
    }else if (distance < 60) {
        string = [NSString stringWithFormat:@"%ld秒前", (distance)];
    }else if (distance < 3600) {//60 * 60
        distance = distance / 60;
        string = [NSString stringWithFormat:@"%ld分钟前", (distance)];
    }else if (distance < 86400) {//60 * 60 * 24
        distance = distance / 3600;
        string = [NSString stringWithFormat:@"%ld小时前", (distance)];
    }else if (distance < 2592000) {//60 * 60 * 24 * 7
        distance = distance / 86400;
        string = [NSString stringWithFormat:@"%ld天前", (distance)];
    }else if (distance < 2419200) {//60 * 60 * 24 * 7 * 4
        distance = distance / 604800;
        string = [NSString stringWithFormat:@"%ld周前", (distance)];
    }else if (distance < 31104000) { // 60 * 60 * 24 * 30 * 12
        distance = distance / 2592000;
        string = [NSString stringWithFormat:@"%ld月前", (distance)];
    }else {
        NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }
        string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(time)]];
        
    }
    return string;
}

+ (NSInteger)year{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.year;
}

+ (NSInteger)month{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.month;
}

+ (NSInteger)day{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.day;
}

+ (NSInteger)hour{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.hour;
}

+ (NSInteger)minute{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.minute;
}

+ (NSInteger)second{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.second;
}

+ (NSInteger)weekday{
    //1是周日2是周一
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierGregorian];
    return components.weekday;
}

+ (NSInteger)yearOfChinese{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierChinese];
    return components.year;
}

+ (NSInteger)monthOfChinese{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierChinese];
    return components.month;
}

+ (NSInteger)dayOfChinese{
    NSDateComponents *components = [NSDate components:NSCalendarIdentifierChinese];
    return components.day;
}

+ (NSDateComponents *)components:(NSString *)calendarIdentifier{
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:calendarIdentifier];    
    // 获取当前日期
    NSDate* dt = [NSDate date];
    // 定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒的信息
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:dt];
    return components;
}
@end
