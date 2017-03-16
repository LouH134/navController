//
//  EditCompanyVC.h
//  NavCtrl
//
//  Created by Louis Harris on 3/9/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"

@interface EditCompanyVC : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *changeCompanyName;
@property (retain, nonatomic) IBOutlet UILabel *changeCompanyPic;
@property (retain, nonatomic) IBOutlet UITextField *companyNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *companyPicTextField;
@property (retain, nonatomic) DAO* dao;
@property (retain, nonatomic) Company* currentCompany;
@property double nameLabelYCoordinate;
@property double picLabelYCoordinate;
@property double nameTextFieldYCoordinate;
@property double picTextFieldYCoordinate;

@end
