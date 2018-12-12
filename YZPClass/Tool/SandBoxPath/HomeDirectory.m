//
//  HomeDirectory.m
//  HomeDirectory
//
//  Created by a on 15/8/2.
//  Copyright (c) 2015年 NeiQuan. All rights reserved.
//

#import "HomeDirectory.h"

@implementation HomeDirectory
/*
 Documents：用于存储用户数据，iTunes备份和恢复的时候会包括此目录，所以，苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下。
 Library：包含两个子目录：Caches 和 Preferences。Caches用来存放用户需要换成的文件。Preferences是APP的偏好设置，可以通过NSUserDefaults来读取和设置。
 tmp： 用于存放临时文件，这个可以放一些当APP退出后不再需要的文件。
 
 */
//NSString *path = [documents stringByAppendingPathComponent:@"exceptionHandler.txt"];
+ (NSString *)returnDocuments{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"path:%@", path);
    return path;

}

+ (NSString *)returnLibrary{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"path：%@", path);
    return path;

}

+ (NSString *)returnCaches{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"path：%@", path);
    return path;
}

+ (NSString *)returnTmp{

    NSString *tmp = NSTemporaryDirectory();
    NSLog(@"tmp：%@", tmp);
    return tmp;

}

@end
