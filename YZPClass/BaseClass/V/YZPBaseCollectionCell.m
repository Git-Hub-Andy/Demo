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
        _titleLabel.textColor = Color_Cell_Line;
        _titleLabel.font = FontSize(13);
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel){
        self.contentLabel = [UILabel new];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = Color_Cell_ContextLabel_Text;
        _contentLabel.font = FontSize(13);
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel){
        self.timeLabel = [UILabel new];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = Color_Cell_TitleLabel_Text;
        _timeLabel.font = FontSize(13);
    }
    return _timeLabel;
}

@end
