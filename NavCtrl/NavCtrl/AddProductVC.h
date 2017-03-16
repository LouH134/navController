//
//  AddProductVC.h
//  NavCtrl
//
//  Created by Louis Harris on 3/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"


@interface AddProductVC : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *productName;
@property (retain, nonatomic) IBOutlet UITextField *productPicTextField;
@property (retain, nonatomic) IBOutlet UITextField *productURL;
@property (retain, nonatomic) DAO* dao;
@property (retain, nonatomic) Company* currentCompany;

@end
