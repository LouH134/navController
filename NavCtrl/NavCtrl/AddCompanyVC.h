//
//  AddCompanyVC.h
//  NavCtrl
//
//  Created by Louis Harris on 3/1/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"



@interface AddCompanyVC : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *companyNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *companyPicTextField;
@property (retain, nonatomic) IBOutlet UITextField *companyStockTxtField;
@property (retain, nonatomic)DAO* dao;




@end
