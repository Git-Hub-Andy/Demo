//
//  LTPickerView.h
//  protoBuffer
//
//  Created by chenfujie on 15/11/20.
//  Copyright © 2015年 Meeno04. All rights reserved.
//
/*
 LTPickerView* pickerView = [LTPickerView new];
 pickerView.dataSource = @[@"150",@"151",@"152",@"153",@"154",@"155",@"156",@"157",@"158",@"159",@"160",@"161",@"162",@"163",@"164",@"165",@"166",@"167",@"168",@"169",@"170",@"171",@"172",@"173",@"174",@"175",@"176",@"177",@"178",@"179",@"180",@"181",@"182",@"183",@"184",@"185",@"186",@"187",@"188",@"189"];//设置要显示的数据
 pickerView.defaultStr = @"170";//默认选择的数据
 [pickerView show];//显示
 //回调block
 pickerView.block = ^(LTPickerView* obj,NSString* str,NSInteger num){
 
 [_contentArray replaceObjectAtIndex:1 withObject:str];
 [weakSelf.tableView reloadData];
 
 };
 */
#import <UIKit/UIKit.h>

@interface LTPickerView : UIView
@property (nonatomic,strong) void (^block)(id obj,NSString* str,NSInteger num);
@property (nonatomic,copy) NSString* title;
@property (nonatomic,strong) NSArray* dataSource;//数据源
@property (nonatomic,copy) NSString* defaultStr;
-(void)show;
-(void)close;
@end
