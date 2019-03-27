//
//  HomeDirectory.h
//  HomeDirectory
//
//  Created by a on 15/8/2.
//  Copyright (c) 2015年 NeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDirectory : NSObject

+ (NSString *)returnDocuments;

+ (NSString *)returnLibrary;

+ (NSString *)returnCaches;

+ (NSString *)returnTmp;

@end
