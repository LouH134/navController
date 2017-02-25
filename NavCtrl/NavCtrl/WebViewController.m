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
    if([self.companyName isEqualToString:@"Apple mobile devices"])
    {
        [self appleProducts];
    }
    else if ([self.companyName isEqualToString:@"Samsung mobile devices"])
    {
        [self samsungProducts];
    }
    else if ([self.companyName isEqualToString:@"Google mobile devices"])
    {
        [self googleProducts];
    }
    else if ([self.companyName isEqualToString:@"Twitter mobile devices"])
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
        self.productURL = [NSURL URLWithString:@"http://www.apple.com/iphone-7/?afid=p238%7Cs6HPNxDZt-dc_mtid_20925d2q39172_pcrid_167993804360&cid=wwa-us-kwgo-iphone-slid--"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual: @"iPad"]){
        
        self.productURL = [NSURL URLWithString:@"http://www.apple.com/ipad/"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"iPod Touch"]){
        
        self.productURL = [NSURL URLWithString:@"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_164984361260_&cid=aos-us-kwgo-ipod--slid--product-"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)samsungProducts
{
    if([self.productName isEqual:@"Galaxy S4"])
    {
        self.productURL = [NSURL URLWithString:@"https://www.amazon.com/Samsung-Galaxy-S4-Verizon-Wireless/dp/B00CRNW3ZI"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Galaxy Note"]){
        
        self.productURL = [NSURL URLWithString:@"http://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Galaxy Tab"]){
        
        self.productURL = [NSURL URLWithString:@"http://www.samsung.com/us/explore/tab-s2-features-and-specs/?cid=ppc-?cid=ppc-"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)googleProducts
{
    if([self.productName isEqual:@"Google Pixel"])
    {
        self.productURL = [NSURL URLWithString:@"https://madeby.google.com/phone/?utm_source=ads-en-ha-na-sem&utm_medium=text-both&ds_kid=43700014535357730&utm_content=new-dr-bkws&utm_campaign=pixel"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
        
    }else if ([self.productName isEqual:@"Google Home"]){
        
        self.productURL = [NSURL URLWithString:@"https://madeby.google.com/home/?utm_source=en-ha-na-sem&utm_medium=cpc&utm_campaign=googlehome"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Google Chromecast"])
    {
        self.productURL = [NSURL URLWithString:@"https://www.google.com/chromecast/tv/explore/?utm_source=en-ha-na-sem&utm_medium=cpc&utm_content=bkws&utm_campaign=tv"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }
}

-(void)twitterProducts
{
    if([self.productName isEqual:@"Twitter Cards"])
    {
        self.productURL = [NSURL URLWithString:@"https://dev.twitter.com/cards/overview"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"Twitter Kit"]){
        
        self.productURL = [NSURL URLWithString:@"https://fabric.io/kits/android/twitterkit"];
        
        NSURLRequest* nsRequest = [NSURLRequest requestWithURL:self.productURL];
        [self.webView loadRequest:nsRequest];
        [self.view addSubview:self.webView];
    }else if ([self.productName isEqual:@"TweetDeck"]){
        
        self.productURL = [NSURL URLWithString:@"https://tweetdeck.twitter.com/"];
        
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
