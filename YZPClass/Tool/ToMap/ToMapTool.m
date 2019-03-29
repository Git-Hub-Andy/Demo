//
//  ToMapTool.m
//  Project
//
//  Created by 袁志浦 on 2018/4/11.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import "ToMapTool.h"
#import <MapKit/MKFoundation.h>
#import <MapKit/MKMapItem.h>

@implementation ToMapTool

+ (void)toAppleMap:(CLLocationCoordinate2D)coordinate{
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil]];
    currentLocation.name = @"我的位置";
    toLocation.name = @"目的地位置";
    [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                   launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
}

+ (void)toGDMap:(CLLocationCoordinate2D)coordinate{
    NSString *urlScheme = @"DemoGDMa";
    NSString *appName = @"PPP";
    NSString *url = [NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=%@&lat=%f&lon=%f&dev=0&style=2",appName,urlScheme,coordinate.latitude, coordinate.longitude];
    
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url.encodedString] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        // Fallback on earlier versions
    }
}

+ (void)toBaiDuMap:(CLLocationCoordinate2D)coordinate{
    
    NSString *url = [NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",coordinate.latitude, coordinate.longitude];

    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url.encodedString] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        // Fallback on earlier versions
    }
}

+ (void)toTencentMap:(CLLocationCoordinate2D)coordinate{
    
    NSString *url = [NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=%f,%f&coord_type=1&policy=0",coordinate.latitude, coordinate.longitude];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url.encodedString] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        // Fallback on earlier versions
    }
}

+ (void)toGoogleMap:(CLLocationCoordinate2D)coordinate{
    NSString *url = [NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",@"appName",@"urlScheme",coordinate.latitude, coordinate.longitude];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url.encodedString] options:@{} completionHandler:^(BOOL success) {}];
    } else {
        // Fallback on earlier versions
    }
}

@end
