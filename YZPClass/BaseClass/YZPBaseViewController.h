//
//  YZPBaseViewController.h
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>

@interface YZPBaseViewController : UIViewController

//导航条底部的黑线（系统和自定义）隐藏和颜色的设置
@property (nonatomic, assign) BOOL navBarSystemLineHidden;

@property (nonatomic, strong) UIColor *navBarLineColor;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, strong) MJRefreshNormalHeader *refreshHeader; //下拉刷新

@property (nonatomic, strong) MJRefreshAutoNormalFooter *refreshFooter; //上拉加载

@property (nonatomic, assign) BOOL isUseKeyboardManager;  //是否使用键盘管理者(默认使用)
@property (nonatomic, assign) NSInteger pageIndex;//页码

@property (nonatomic, strong) UIImageView *backgroundView;//背景

//配置初始化的参数 (供子类重写)
- (void)configParams;

//配置容器类 (供子类重写)
- (void)configContainer;

//添加views (供子类重写)
- (void)addOwnViews;

//配置,布局views (供子类重写)
- (void)configOwnViews;

//为热更新预留的方法
- (void)reserveJS;

#pragma mark - handle action

///列表数据网络请求
- (void)requestListDataAnimation:(BOOL)animated;

//解析数据
- (void)receiveListData:(id)data;

///下拉刷新 -- 触发事件
- (void)onDownPullRefresh:(MJRefreshNormalHeader *)refreshHeader;

//上拉加载 -- 触发事件
- (void)onUpPullRefresh:(MJRefreshAutoNormalFooter *)refreshFooter;

///停止刷新
- (void)endRefreshing;

//点击某个按钮执行的事件（确定/删除/完成）
- (void)handleComplete:(UIButton *)sender;

//左侧按钮 dismiss
- (void)handleDismiss;

//左侧返回按钮 -- pop
- (void)handlePop;

#pragma mark - network
//单纯的网络请求
- (void)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary*dic))success fail:(void(^)(NSError*error))fail;

//耦合视图层的请求
- (void)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary*dic))success fail:(void(^)(NSError*error))fail sendView:(UIView *)sendView animSuperView:(UIView *)animSuperView animated:(BOOL)animated;

#pragma mark - helper
//查找到某视图高度小于1的UIImageView控件
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view;

@end
