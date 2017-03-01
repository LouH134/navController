//
//  WebViewController.m
//  NavCtrl
//
//  Created by Louis Harris on 2/22/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configWebView];
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    if([self.companyName isEqualToString:@"Apple"])
    {
        [self appleProducts];
    }
    else if ([self.companyName isEqualToString:@"Samsung"])
    {
        [self samsungProducts];
    }
    else if ([self.companyName isEqualToString:@"Google"])
    {
        [self googleProducts];
    }
    else if ([self.companyName isEqualToString:@"Twitter"])
    {
        [self twitterProducts];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configWebView
{
    WKWebViewConfiguration* theConfiguration = [[WKWebViewConfiguration alloc]init];
    self.webView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:theConfiguration];
    //[self.view addSubview:webView];
    self.webView.navigationDelegate = self;
}

-(void)appleProducts
{
    if([self.productName  isEqual: @"iPhone"])
    {
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual: @"iPad"]){
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"iPod Touch"]){
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)samsungProducts
{
    if([self.productName isEqual:@"Galaxy S4"])
    {
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Galaxy Note"]){
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Galaxy Tab"]){
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)googleProducts
{
    if([self.productName isEqual:@"Google Pixel"])
    {
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
        
    }else if ([self.productName isEqual:@"Google Home"]){
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Google Chromecast"])
    {
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)twitterProducts
{
    if([self.productName isEqual:@"Twitter Cards"])
    {
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Twitter Kit"]){
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"TweetDeck"]){
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"Loaded");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
