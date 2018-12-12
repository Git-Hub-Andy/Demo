//
//  UITableView+EmptyData.h
//  FunyAlley
//
//  Created by 袁志浦 on 2018/8/17.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyData)

//添加一个方法
- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

- (void)noMoreDataFootView:(NSUInteger)rowCount message:(NSString *)message;
@end
