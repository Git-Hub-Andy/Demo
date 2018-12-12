//
//  YZPBaseCell.h
//  TheProject
//
//  Created by 袁志浦 on 16/5/28.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZPBaseCell : UITableViewCell

@property(nonatomic,strong)NSIndexPath *cellIndexPath;

///展示图标的btn
@property (nonatomic, strong) UIButton *imgBtn;

///展示图片的imageView
@property (nonatomic, strong) UIImageView *imgView;

///展示标题的label
@property (nonatomic, strong) UILabel *titleLabel;

///展示内容的label
@property (nonatomic, strong) UILabel *contentLabel;

///展示当前状态的
@property (nonatomic, strong) UILabel *stateLabel;

///展示时间的label
@property (nonatomic, strong) UILabel *timeLabel;

///线
@property (nonatomic, strong) UIView *bottomLineView;

//供子类重写
- (void)addSubViews;

@end
