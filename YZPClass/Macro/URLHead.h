//
//  URLHead.h
//  TheProject
//
//  Created by 袁志浦 on 16/7/14.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//


#ifndef URLHead_h
#define URLHead_h

#define BaseUrl @"http://118.190.89.120:8080/pure_fw_sm/"

#define UrlWithApi(API)  [NSString stringWithFormat:@"%@%@",BaseUrl,API]

#pragma mark - 注册
/*
 phone    //手机号
 authCode //验证码
 password //密码
 */
#define LSB_Register_API    UrlWithApi(@"user/register")

#endif /* URLHead_h */
