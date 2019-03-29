//
//  HomeViewController.m
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    UIView *_v;
}

@property (nonatomic,strong)UILabel *usernameLabel;

@property (nonatomic,strong)UILabel *contentLabel;
@end

@implementation HomeViewController

- (void)C{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 300, 200)];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    
//    //------
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"1321313123211273127318273819273817381738713712837173812731837128371297319737131719371273187328193721731793\n"];
//
//    //设置字体颜色
//    [text addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, text.length)];
//
//    //设置缩进、行距
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    style.headIndent = 30;//缩进
//    style.firstLineHeadIndent = 0;
//    style.lineSpacing = 10;//行距
//    [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    
     
    //------
    NSMutableAttributedString *text2 = [[NSMutableAttributedString alloc] initWithString:@"eqeqeuqoeuquequeqeqwuequeqoueqowueqoueqoshfkahfksdafhkalhfkdshf"];
    //设置字体颜色
    [text2 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, text2.length)];
    
    //设置缩进、行距
    NSMutableParagraphStyle *style2 = [[NSMutableParagraphStyle alloc] init];
    style2.headIndent = 0;
    style2.firstLineHeadIndent = 20;
    style2.lineSpacing = 5;
    [text2 addAttribute:NSParagraphStyleAttributeName value:style2 range:NSMakeRange(0, text2.length)];
    //------
    
//    [text appendAttributedString:text2];
    
    label.attributedText = text2;
    [self.view addSubview:label];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"你好";
    
    NSLog(@"%@",@"测试");
    NSLog(@"测试");
    
    [self C];
//    _v = [[UIView alloc] init];
//    [self.view addSubview:_v];
//    [_v mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@(AdaptedWidth(100)));
//        make.top.equalTo(@(AdaptedWidth(100)));
//        make.width.equalTo(@(AdaptedWidth(100)));
//        make.height.equalTo(@(AdaptedWidth(100)));
//    }];
//    _v.backgroundColor = [UIColor redColor];
//    _v.userInteractionEnabled = YES;
//    [_v addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(AA)]];
    
//    LOG(@"frame:%@",NSStringFromCGRect(v.frame));
//    LOG(@"X:%f",v.x);
//    LOG(@"Y:%f",v.y);
//    LOG(@"Width:%f",v.width);
//    LOG(@"Height:%f",v.height);
//    LOG(@"Left:%f",v.left);
//    LOG(@"Right:%f",v.right);
//    LOG(@"Top:%f",v.top);
//    LOG(@"Bottom:%f",v.bottom);
//    LOG(@"Bottom:%f",v.bottom);
}

/**
 在info.plist 文件里面，添加一个字段：LSApplicationQueriesSchemes，类型为数组，然后在这个数组里面再添加我们所需要的地图 URL Scheme :
 comgooglemaps
 iosamap
 baidumap
 qqmap
 */
@end
