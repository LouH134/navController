//
//  ProductVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "Product.h"
#import "DAO.h"
#import "AddProductVC.h"
#import "Company.h"
#import "EditProductVC.h"


@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) WebViewController* detailViewController;
@property (nonatomic, retain) Company* currentCompany;
@property (nonatomic, retain) EditProductVC* editProduct;
@property (nonatomic, retain) DAO* dataManager;
@property (retain, nonatomic) IBOutlet UIImageView *companyLogo;
@property (retain, nonatomic) IBOutlet UILabel *companyTitle;


@end
