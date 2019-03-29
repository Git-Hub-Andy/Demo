//
//  ColorHeader.h
//  ZiYuan
//
//  Created by a on 15/7/1.
//  Copyright (c) 2015年 NeiQuan. All rights reserved.
//

#ifndef Header_h
#define Header_h

#ifdef DEBUG

#define NSLog(fmt,...) NSLog((@"\n----------------------------------------------------------------------------------------------------\n" fmt @"\n----------------------------------------------------------------------------------------------------"),##__VA_ARGS__);
#else

#define NSLog(...)

#endif

//角度和弧度转换
#define DegreesToRadian(x) (M_PI * (x) / 180.0)
#define RadianToDegrees(radian) (radian*180.0)/(M_PI)

//主window
#define MainWindow [UIApplication sharedApplication].windows[0]

//预防Block循环引用
#define WS(WeakSelf)  __weak __typeof(self)WeakSelf = self;

#define USER_TOKEN  @"userToken"

#define USER_PHONE @"phone"

#define USER_HEADURL @"headUrl"

#define USER_NAME @"LSBUSERNAME"


#endif
