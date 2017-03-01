//
//  WebViewController.h
//  NavCtrl
//
//  Created by Louis Harris on 2/22/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface WebViewController : UIViewController<WKNavigationDelegate>

@property (strong, nonatomic)WKWebView* webView;
@property (strong, nonatomic)NSURL* productURL;
@property (strong, nonatomic)NSString* productName;
@property (strong, nonatomic)NSString* companyName;

@end
