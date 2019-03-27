//
//  HomeViewController.m
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "HomeViewController.h"

#import "NetWork.h"

#import "ToMapTool.h"

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
    
    NSLOG(@"%@",@"测试");
    NSLOG(@"测试");
    
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
- (void)AA{

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(33.014142,112.540797);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]]){
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [ToMapTool toAppleMap:coordinate];
        }];
        [alert addAction:action];
    }
    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]){
        
        ///coord_type 允许的值为 bd09ll、gcj02、wgs84，如果你 APP 的地图 SDK 用的是百度地图 SDK，请填 bd09ll，否则就填gcj02，wgs84的话基本是用不上了（需要涉及到地图加密，有兴趣的同学可以自己去了解）
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [ToMapTool toBaiDuMap:coordinate];
        }];
        [alert addAction:action];
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]){
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [ToMapTool toGDMap:coordinate];
        }];
        [alert addAction:action];
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]){
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [ToMapTool toTencentMap:coordinate];
            
        }];
        [alert addAction:action];
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]){
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"谷歌地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [ToMapTool toGoogleMap:coordinate];
        }];
        [alert addAction:action];
    }

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:^{}];
    
}
@end
