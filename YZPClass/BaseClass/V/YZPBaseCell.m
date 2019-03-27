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
    
}

#pragma mark - Lazy load
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

- (UILabel *)stateLabel{
    if (!_stateLabel){
        self.stateLabel = [UILabel new];
        _stateLabel.textColor = [UIColor lightGrayColor];
        _stateLabel.font = FontSize(13);
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
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

- (UIView *)bottomLineView{
    if (!_bottomLineView){
        self.bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = Color_Cell_Line;
        [self addSubview:_bottomLineView];
    }
    return _bottomLineView;
}

@end
