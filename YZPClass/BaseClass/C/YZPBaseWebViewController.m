//
//  YZPBaseWebViewController.m
//  Project
//
//  Created by 袁志浦 on 2017/12/12.
//  Copyright © 2017年 北京惠发科技有限公司. All rights reserved.
//

#import "YZPBaseWebViewController.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface YZPBaseWebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
{
    WKWebView *_webView;
    WKUserContentController *_userContentController;
}

@end

@implementation YZPBaseWebViewController

- (void)dealloc{
    [_webView.configuration.userContentController removeScriptMessageHandlerForName:@"clickUser"];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册JS方法
    _userContentController =[[WKUserContentController alloc]init];
    [_userContentController addScriptMessageHandler:self name:@"clickUser"];
    
    //配置环境
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    configuration.userContentController = _userContentController;
    
    //WebView
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 20, Screen_Width, Screen_Height-20) configuration:configuration];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    //    NSString *str = [NSString stringWithFormat:@"%@index.html?token=%@",H5HTTPHEADER,[[NSUserDefaults standardUserDefaults] objectForKey:@"Token"]];
    
    NSString *str = @"http://192.168.199.3:3000/mayun/ta-ta/src/template/home.html";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:_webView];
    
    [self createButton];
    
    
}

- (void)createButton{
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    
    UIButton *aButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    aButton.backgroundColor = [UIColor blackColor];
    [aButton addTarget:self action:@selector(aButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aButton];
    
}

//OC拦截JS方法做的处理
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"JS 调用了 %@ 方法，传回参数 %@",message.name,message.body);
    if ([message.name isEqualToString:@"clickUser"]) {
        
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

    NSString *js = [NSString stringWithFormat:@"getTokenUserId('%@')", @""];
    [_webView evaluateJavaScript:js completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
        if (!error) {
            
        }
        
    }];

}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

}

//OC调用JS方法做的处理
-(void)buttonClick{
    
    
}

- (void)aButtonClick{
    NSString *str = @"http://192.168.199.3:3000/mayun/ta-ta/src/template/heiQianXian.html";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    NSLog(@"message = %@", message);
}

@end
