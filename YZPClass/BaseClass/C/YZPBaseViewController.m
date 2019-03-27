//
//  YZPBaseViewController.m
//  Project
//
//  Created by 袁志浦 on 2017/9/25.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#define NetWorkErrorFooterString @"点击或拖拽重试"


#import "YZPBaseViewController.h"
#import "NetWork.h"

@interface YZPBaseViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation YZPBaseViewController
/*
- (void)viewDidLoad{
 
     if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
     }
 
    //适配VC中的tableView向下移动部分距离，以及cell直接的间隔会无故拉大：
    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
//    如果你的cell 之间的间距拉大，就在self.xf_tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);这个约束后面添加下面三个约束
//
//    self.xf_tableView.estimatedRowHeight = 0;
//
//    self.xf_tableView.estimatedSectionHeaderHeight = 0;
//
//    self.xf_tableView.estimatedSectionFooterHeight = 0;
    
//    3、加载webView的时候会向下移动部分距离：给你的web添加下面约束
//    if (@available(iOS 11.0, *)) {
//        webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//
//    }
    
    if (@available(iOS 11.0, *)) {
        NSLog(@"safeAreaInset list= %@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
        NSLog(@"safeAreaLayout list= %@",self.view.safeAreaLayoutGuide);
    }
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self baseConfigure];   //baseVC的基本配置
    
    [self configParams];    //配置初始参数
    [self configContainer]; //配置容器类属性
    [self addOwnViews];     //添加views
    [self configOwnViews];  //配置,布局views
    [self requestListDataAnimation:YES]; //请求列表数据
    [self reserveJS];       //为热更新预留
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self configureNaviBarLine];  //配置导航条底线
    
//    //修改键盘管理者的属性
//    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor = NO;
//    [IQKeyboardManager sharedManager].toolbarTintColor = QF_BlackColor;
//    [IQKeyboardManager sharedManager].enable = YES;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

//解决系统提供的侧滑失效问题
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar endEditing:YES];
    [self.view endEditing:YES];
}

//基础配置
- (void)baseConfigure
{
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航底线相关属性
    self.naviBarSystemLine_hidden = YES;
    self.naviBarCustomLine_hidden = NO;
    
    self.fd_interactivePopDisabled = YES;  //全屏侧滑设置
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    //self.extendedLayoutIncludesOpaqueBars = YES;
    //self.navigationController.navigationBar.translucent = YES;
    //self.tabBarController.tabBar.translucent = YES;
    //self.automaticallyAdjustsScrollViewInsets = YES;
    
    //统一设置导航栏返回按钮(设置后系统提供的侧滑pop会失效)
    if (self.navigationController.childViewControllers.count > 1){
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:Image_NaviBar_Left_Back style:UIBarButtonItemStylePlain target:self action:@selector(handlePop)];
        self.hidesBottomBarWhenPushed = YES;
    }
    
    self.isUseKeyboardManager = YES;  //(默认使用键盘管理者)
}

#pragma mark - SubClass Override
//配置初始化的参数（供子类重写）
- (void)configParams{
    
}

//配置容器类（供子类重写）
- (void)configContainer{
    
}

//添加views (供子类重写)
- (void)addOwnViews{
    
}

//配置,布局views (供子类重写)
- (void)configOwnViews{
    
}

//为热更新预留
- (void)reserveJS{
    
}

//创建tableView
- (void)setupTableView:(UITableViewStyle)style{
    self.tableView = [[YZPBaseTableView alloc]initWithFrame:self.view.bounds style:style];
    CGRect headerRect = (style == UITableViewStylePlain) ? CGRectZero : CGRectMake(0, 0, _tableView.mj_w, 0.001);
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:headerRect];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:headerRect];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


#pragma mark - handle action
//列表数据网络请求(供子类重写)
- (void)requestListDataAnimation:(BOOL)animated{

}

//点击某个按钮执行的事件（确定/删除/完成）
- (void)handleComplete:(UIButton *)sender{
    
}

//左侧按钮 dismiss
- (void)handleDismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//左侧返回按钮 -- pop
- (void)handlePop{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - network
//单纯的网络请求
- (void)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary*dic))success fail:(void(^)(NSError*error))fail{
//    [NetWork POST:url parameters:parameters success:^(NSDictionary *dic) {
//
//        NSInteger code = [dic[@"code"] integerValue];
//        if (code == Success){
//            success(dic);
//        }
//
//    } fail:^(NSError *error) {
//
//        fail(error);
//    }];
}

//耦合视图层的请求
- (void)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary*dic))success fail:(void(^)(NSError*error))fail sendView:(UIView *)sendView animSuperView:(UIView *)animSuperView animated:(BOOL)animated{
    WS(weakSelf)
    
//    [NetWork POST:url parameters:parameters success:^(NSDictionary *dic) {
//        
//        self.refreshFooter.hidden = NO;
//        [weakSelf endRefreshing];
//        
//        NSInteger code = [dic[@"code"] integerValue];
//        if (code == Success){
//            success(dic);
//        }else{
//            [self.view showToastMsg:dic[@"errorMessage"]];
//            self.refreshFooter.stateLabel.text = NetWorkErrorFooterString;
//            self.refreshFooter.userInteractionEnabled = YES;
//        }
//        
//    } fail:^(NSError *error) {
//        
//        self.refreshFooter.hidden = NO;
//        [self endRefreshing];
//        self.refreshFooter.stateLabel.text = NetWorkErrorFooterString;
//        self.refreshFooter.userInteractionEnabled = YES;
//        fail(error);
//        
//    } sendView:sendView animSuperView:self.view animated:animated];
}

//解析数据
- (void)receiveListData:(id)data{
    
}

//下拉刷新 -- 触发事件
- (void)onDownPullRefresh:(MJRefreshNormalHeader *)refreshHeader{
    _pageIndex = 0;
    [self requestListDataAnimation:NO];
    //    ((UIScrollView *)self.refreshHeader.superview).scrollEnabled = NO;
    if (_refreshFooter){
        self.refreshFooter.stateLabel.text = @"刷新中...";
        self.refreshFooter.userInteractionEnabled = NO;
    }
}

//上拉加载 -- 触发事件
- (void)onUpPullRefresh:(MJRefreshAutoNormalFooter *)refreshFooter{
    if (self.dataSourceArray.count == 0){
        _pageIndex = 0;
    }else{
        _pageIndex ++;
    }
    
    [self.refreshFooter beginRefreshing];
    [self requestListDataAnimation:NO];
}

#pragma mark - Lazy Load
- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray){
        self.dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

- (YZPBaseTableView *)tableView{
    if (!_tableView){
        _tableView = [[YZPBaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView){
        self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

//下拉刷新控件
- (MJRefreshNormalHeader *)refreshHeader{
    if (!_refreshHeader){
        
        self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(onDownPullRefresh:)];
        //_refreshHeader.stateLabel.hidden = YES;
        _refreshHeader.stateLabel.textColor = [UIColor lightGrayColor];
        _refreshHeader.stateLabel.font = [UIFont systemFontOfSize:14];
        
        _refreshHeader.lastUpdatedTimeLabel.textColor = [UIColor lightGrayColor];
        _refreshHeader.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _refreshHeader;
}

//上拉加载控件
- (MJRefreshAutoNormalFooter *)refreshFooter{
    if (!_refreshFooter){
        self.refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(onUpPullRefresh:)];
        _refreshFooter.stateLabel.textColor = [UIColor lightGrayColor];
        _refreshFooter.stateLabel.font = [UIFont systemFontOfSize:14];
    }
    return _refreshFooter;
}

//停止刷新
- (void)endRefreshing{
    [self.refreshHeader endRefreshing];
    [self.refreshFooter endRefreshing];
//    ((UIScrollView *)self.refreshHeader.superview).scrollEnabled = YES;
}

- (AppDelegate *)appDelegate{
    return [AppDelegate sharedAppDelegate];
}

#pragma mark - KeyBoard
//点击空白回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - UIGestureRecognizerDelegate
//解决系统提供的侧滑失效问题
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController && [self.navigationController.viewControllers count] == 1){
        return NO;
    }
    return YES;
}

//解决有水平方向滚动的ScrollView时边缘返回手势失效的问题
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - helper
//配置导航条底线
- (void)configureNaviBarLine{
    //获取到导航底部的黑线控件
    UIImageView *bottomLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //默认显示黑线
    bottomLineImageView.hidden = NO;
    
    if (_naviBarSystemLine_hidden){
        bottomLineImageView.hidden = YES;
    }
    
    //自定义底线
    UIView *tabBarLineView = [self.navigationController.navigationBar viewWithTag:10001];
    
    tabBarLineView.backgroundColor = _naviBarCustomLine_color;
    
    if (!_naviBarCustomLine_hidden){
        _naviBarSystemLine_hidden = YES;
        bottomLineImageView.hidden = YES;
        
        if (!tabBarLineView){
            tabBarLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.mj_w, 64)];
            tabBarLineView.tag = 10001;
            tabBarLineView.alpha = 0.8;
            [self.navigationController.navigationBar addSubview:tabBarLineView];
        }
        tabBarLineView.hidden = NO;
        tabBarLineView.backgroundColor = _naviBarCustomLine_color;
    }else{
        if (tabBarLineView){
            tabBarLineView.hidden = YES;
            tabBarLineView.backgroundColor = _naviBarCustomLine_color;
        }
    }
}

//查找到某视图高度小于1的UIImageView控件
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0){
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews){
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView){
            return imageView;
        }
    }
    return nil;
}

#pragma mark - dealloc
- (void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Memory
//内存警告处理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if ([self isViewLoaded] && !self.view.window){
        self.view = nil;
    }
}

@end
