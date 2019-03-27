//
//  TestViewController.m
//  Project
//
//  Created by 袁志浦 on 2018/11/20.
//  Copyright © 2018 北京惠发科技有限公司. All rights reserved.
//

#import "TestViewController.h"
#import "TestTableViewCell.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSArray *stringArray;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:@"TestTableViewCell"];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.stringArray = @[@"阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡",@"阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡",@"阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡",@"阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡阿娇啊积分卡的饭卡还得罚款就会发块话费卡号大课间活动饭卡啊还得罚款交话费快接电话卡"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell" forIndexPath:indexPath];
    cell.contentLabel.text = self.stringArray[indexPath.row%4];
    cell.contentLabel.font = [UIFont systemFontOfSize:10];
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
