//
//  EditProductVC.h
//  NavCtrl
//
//  Created by Louis Harris on 3/9/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Product.h"

@interface EditProductVC : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *productNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *productPicLabel;
@property (retain, nonatomic) IBOutlet UILabel *productURLLabel;
@property (retain, nonatomic) IBOutlet UITextField *editProductName;
@property (retain, nonatomic) IBOutlet UITextField *editProductPic;
@property (retain, nonatomic) IBOutlet UITextField *editProductURL;
@property (retain, nonatomic) DAO* dao;
@property (retain, nonatomic) Product* currentProduct;
@property double productNameLabelCoordinate;
@property double productNameTxtFieldCoordinate;
@property double productPicLabelCoordinate;
@property double productPicTxtFieldCoordinate;
@property double productURLLabelCoordinate;
@property double productURLTxtFieldCoordinate;




@end
