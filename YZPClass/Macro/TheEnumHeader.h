//
//  EnumHeader.h
//  WeiWeiSheJiao
//
//  Created by 袁志浦 on 2016/9/29.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#ifndef TheEnumHeader_h
#define TheEnumHeader_h

typedef NS_ENUM(NSInteger, OurServiceCode) {//我们的服务器code含义
    SUCCESS = 200,//成功    
//     = 201,//一般逻辑性错误
//     = 202,//接口系统错误
//     = 203,//接口错误
};

typedef NS_ENUM(NSUInteger, OrderType) {

    ToSetOut = 1,        //待出发
    ToReach  = 2,        //待到达
    ToBeConfirmed = 3,   //待确认
    ForMaintenance = 4,  //待维修
    ToBeProcessed  = 5,  //待处理
    InTheMaintenance = 6,//维修中
    HasBeenCompleted = 7,//已完成
};

typedef NS_ENUM(NSUInteger, DetailType) {    
    EveryoneKnowledge = 10,        //知识库
    MineKnowledge  = 20,        //我的知识库
};


#endif /* TheEnumHeader_h */
