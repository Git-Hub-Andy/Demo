//
//  YZPBaseCollectionCell.m
//  Project
//
//  Created by 袁志浦 on 2017/9/26.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "YZPBaseCollectionCell.h"

@implementation YZPBaseCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor whiteColor];
        [self createViews];
        [self layoutViews];
    }
    return self;
}

//供子类重写
- (void)createViews{
    
}

//供子类重写
- (void)layoutViews{
    
}

#pragma mark - Lazy load

- (UIView *)bgView{
    if (!_bgView){
        self.bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}

- (UIButton *)imgBtn{
    if (!_imgBtn){
        self.imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _imgBtn.userInteractionEnabled = NO;
        _imgBtn.layer.masksToBounds = YES;
    }
    return _imgBtn;
}

- (UIImageView *)imgView{
    if (!_imgView){
        self.imgView = [UIImageView new];
    }
    return _imgView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel){
        _contentLabel = [UILabel new];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel){
        _timeLabel = [UILabel new];
        _timeLabel.textAlignment = NSTextAlignmentRight;        
    }
    return _timeLabel;
}

@end
