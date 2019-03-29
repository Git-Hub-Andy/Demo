//
//  YZPBaseCell.m
//  TheProject
//
//  Created by 袁志浦 on 16/5/28.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "YZPBaseCell.h"

@interface YZPBaseCell ()

@end

@implementation YZPBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubViews];
    }
    return self;
    
}

- (void)addSubViews{
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

#pragma mark - Lazy load
- (UIButton *)imgBtn{
    if (!_imgBtn){
        _imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _imgBtn.userInteractionEnabled = NO;
        _imgBtn.layer.masksToBounds = YES;
    }
    return _imgBtn;
}

- (UIImageView *)imgView{
    if (!_imgView){
        _imgView = [UIImageView new];
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

- (UILabel *)stateLabel{
    if (!_stateLabel){
        _stateLabel = [UILabel new];
        _stateLabel.textColor = [UIColor lightGrayColor];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel){
        _timeLabel = [UILabel new];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UIView *)bottomLineView{
    if (!_bottomLineView){
        _bottomLineView = [UIView new];
    }
    return _bottomLineView;
}

@end
