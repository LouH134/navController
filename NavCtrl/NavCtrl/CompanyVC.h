//
//  CompanyVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductVC.h"
#import "Company.h"
#import "Product.h"
#import "DAO.h"
#import "AddCompanyVC.h"
#import "EditCompanyVC.h"
#import "NavControllerAppDelegate.h"

@interface CompanyVC : UIViewController<UITableViewDelegate, UITableViewDataSource, DAODelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) ProductVC *productViewController;
@property (nonatomic, retain) AddCompanyVC *addCompanyVC;
@property (nonatomic, retain) EditCompanyVC* editCompany;
@property (nonatomic, retain) DAO* dataManager;
@property (retain, nonatomic) IBOutlet UIView *emptyView;



@end
