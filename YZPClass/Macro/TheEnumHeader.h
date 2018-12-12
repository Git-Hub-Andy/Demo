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
};

typedef NS_ENUM(NSUInteger, ALiPayOrWChatPay) {//区分是支付宝还是微信
    ALiPay = 10,//支付宝
    WChatPay  = 20,//微信
};

typedef NS_ENUM(NSUInteger, RecordType) {//记录
    CanSaiRecord = 30,//参赛纪录
    BanSaiRecord  = 40,//办赛记录
    FuWuRecord  = 50,//服务记录
};

typedef NS_ENUM(NSUInteger, SayType) {//评论类型
    SayCaiPanType = 60,//评论裁判
    SayGameType  = 70,//评论比赛
};

#endif /* TheEnumHeader_h */
