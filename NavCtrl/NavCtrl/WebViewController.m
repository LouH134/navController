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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(goToEditProductVC)];
    
   
}

-(void)goToEditProductVC
{
    self.editProduct = [[EditProductVC alloc]init];
    self.editProduct.currentProduct = self.currentProduct;
    self.editProduct.currentCompany = self.currentCompany;
    [self.navigationController pushViewController:self.editProduct animated:YES];

    
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
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    
    WKWebViewConfiguration* theConfiguration = [[WKWebViewConfiguration alloc]init];
    self.webView = [[WKWebView alloc]initWithFrame:screenBounds configuration:theConfiguration];
    self.webView.navigationDelegate = self;
}

-(void)appleProducts
{
    if([self.productName  isEqual: @"iPhone"])
    {
        NSURL* iPhoneURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:iPhoneURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual: @"iPad"]){
        
        NSURL* iPadURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:iPadURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"iPod Touch"]){
        NSURL* iPodTouchURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:iPodTouchURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)samsungProducts
{
    if([self.productName isEqual:@"Galaxy S4"])
    {
        NSURL* galaxyS4URL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:galaxyS4URL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Galaxy Note"]){
        NSURL* galaxyNoteURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:galaxyNoteURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Galaxy Tab"]){
        NSURL* galaxyTabURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:galaxyTabURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)googleProducts
{
    if([self.productName isEqual:@"Google Pixel"])
    {
        NSURL* googlePixelURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:googlePixelURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
        
    }else if ([self.productName isEqual:@"Google Home"]){
        NSURL* googleHomeURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:googleHomeURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Google Chromecast"])
    {
        NSURL* googleChromecastURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:googleChromecastURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)twitterProducts
{
    if([self.productName isEqual:@"Twitter Cards"])
    {
        NSURL* twitterCardsURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:twitterCardsURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Twitter Kit"]){
        
        NSURL* twitterKitURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:twitterKitURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"TweetDeck"]){
        
        NSURL* tweetDeckURL = [NSURL URLWithString:self.productURL];
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:tweetDeckURL];
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
