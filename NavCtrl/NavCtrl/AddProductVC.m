//
//  AddProductVC.m
//  NavCtrl
//
//  Created by Louis Harris on 3/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "AddProductVC.h"

@interface AddProductVC ()

@end

@implementation AddProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Add Product";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNewProduct)];
    
    self.dao = [DAO sharedManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)saveNewProduct
{
    if(self.productName.hasText && self.productPicTextField.hasText && self.productURL.hasText)
    {
        Product* newlyAddedProduct = [[Product alloc]initWithProduct:self.productName.text andLogo:self.productPicTextField.text andURL:[NSURL URLWithString:self.productURL.text]];
        [self.dao insertNewProduct:newlyAddedProduct forCompany:self.currentCompany];
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:YES];
    }else{
        [self checkForText];
    }
}

-(void)checkForText
{
    UIAlertController* noTextAlert = [UIAlertController alertControllerWithTitle:@"Missing Field" message:@"A Field Has Not Been Filled Out!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action)
                        {
                            NSLog(@"Resolving UIAlertActionController for tapping OK");
                            [noTextAlert dismissViewControllerAnimated:YES completion:nil];
                            
                        }];
    [noTextAlert addAction:ok];
    [self presentViewController:noTextAlert animated:YES completion:nil];
}

- (void)dealloc {
    [_productName release];
    [_productPicTextField release];
    [_productURL release];
    [super dealloc];
}
@end
