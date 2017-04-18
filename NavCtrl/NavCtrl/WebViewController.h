//
//  WebViewController.h
//  NavCtrl
//
//  Created by Louis Harris on 2/22/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "EditProductVC.h"
#import "Company.h"
#import "Product.h"


@interface WebViewController : UIViewController<WKNavigationDelegate>

@property (strong, nonatomic)WKWebView* webView;
@property (strong, nonatomic)NSString* productURL;
@property (strong, nonatomic)NSString* productName;
@property (strong, nonatomic)NSString* companyName;
@property (nonatomic, retain) EditProductVC* editProduct;
@property (nonatomic, retain) Company* currentCompany;
@property (nonatomic, retain) Product* currentProduct;

-(void)dealloc;

@end
