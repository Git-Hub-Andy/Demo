//
//  YZPBaseCollectionCell.h
//  Project
//
//  Created by 袁志浦 on 2017/9/26.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZPBaseCollectionCell : UICollectionViewCell

///用于作为背景图
@property (nonatomic, strong) UIView *bgView;

///展示图标的btn
@property (nonatomic, strong) UIButton *imgBtn;

///展示图片的imageView
@property (nonatomic, strong) UIImageView *imgView;

///展示标题的label
@property (nonatomic, strong) UILabel *titleLabel;

///展示内容的label
@property (nonatomic, strong) UILabel *contentLabel;

///展示时间的label
@property (nonatomic, strong) UILabel *timeLabel;

@end
