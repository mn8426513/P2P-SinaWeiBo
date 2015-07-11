//
//  IWOAuthViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SWOAuthViewController.h"
#import "SWAccount.h"
#import "SWAccountTool.h"
#import "SWNewAndTabChangeTool.h"
#import "MBProgressHUD+MJ.h"
#import "SWCommon.h"
#import "SWHttpTool.h"

@interface SWOAuthViewController () <UIWebViewDelegate>

@end

@implementation SWOAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //加载授权页面，让用户授权。然后获得 code
    UIWebView *webview = [[UIWebView alloc] init];
    webview.frame = self.view.bounds;
    [self.view addSubview:webview];
    webview.delegate = self;
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",SWAppID,SWRedirct_url];
   
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
}


#pragma mark - webView代理方法
/**
 *  当webView发送一个请求之前都会先调用这个方法, 询问代理可不可以加载这个页面(请求)

 */

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = request.URL.absoluteString;
    NSRange range = [urlString rangeOfString:@"code="];
    if(range.length){
        unsigned long loc = range.location + range.length;
        NSString *code = [urlString substringFromIndex:loc];
        [self getAccessToken:code];
        return NO;
     }
   return YES;
}

-(void)getAccessToken:(NSString *)code
{
    // 2.封装请求参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"client_id"] = SWAppID;
    parameter[@"client_secret"] = SWSecret;
    parameter[@"grant_type"] = @"authorization_code";
    parameter[@"code"] = code;
    parameter[@"redirect_uri"] = SWRedirct_url;
    
    // 3.发送请求
    [SWHttpTool postWithUrl:@"https://api.weibo.com/oauth2/access_token"  parameter:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //4.先将字典转为模型
         SWAccount *account = [SWAccount accountWithDict:responseObject];
        // 5.存储模型数据
        [SWAccountTool saveAccount:account];

        [MBProgressHUD hideHUD];
        // 6.新特性或是去首页
        [SWNewAndTabChangeTool NewOrTab];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUD];

    }];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载当中..."];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}
@end
