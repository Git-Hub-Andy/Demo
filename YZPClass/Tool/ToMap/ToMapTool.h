//
//  ToMapTool.h
//  Project
//
//  Created by 袁志浦 on 2018/4/11.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

//#define AppleMapSheme @"appleMapSheme"
//
//#define BaiDuMapSheme @"baidumap"
//
//#define GDMapSheme @"iosamap"
//
//#define GoogleMapSheme @"comgooglemaps"
//
//#define TencentSheme @"qqmap"

#import <Foundation/Foundation.h>

@interface ToMapTool : NSObject

+ (void)toAppleMap:(CLLocationCoordinate2D)coordinate;

+ (void)toGDMap:(CLLocationCoordinate2D)coordinate;

+ (void)toBaiDuMap:(CLLocationCoordinate2D)coordinate;

+ (void)toTencentMap:(CLLocationCoordinate2D)coordinate;

+ (void)toGoogleMap:(CLLocationCoordinate2D)coordinate;


@end
