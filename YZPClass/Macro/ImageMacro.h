//
//  Image.h
//  FullRich
//
//  Created by 任强宾 on 16/10/26.
//  Copyright © 2016年 任强宾. All rights reserved.
//

#ifndef Image_h
#define Image_h

#pragma mark - 简写工具
/********************简写工具********************/
//简写Image
#define Image(imageName) [UIImage imageNamed:imageName]

//导航条 -- 左侧的返回按钮图标
#define Image_NaviBar_Left_Back    Image(@"all_back")

//banner占位图
#define Image_PlaceHolder_Banner   [UIImage imageNamed:@"PlaceHolder_Banner"]

//头像的占位图
#define Image_PlaceHolder_Header   [UIImage imageNamed:@"PlaceHolder_Header"]

//Cell上的占位图
#define Image_PlaceHolder_Cell     [UIImage imageNamed:@"PlaceHolder_Cell"]

#endif /* Image_h */
