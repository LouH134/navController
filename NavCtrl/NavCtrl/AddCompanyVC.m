//
//  AddCompanyVC.m
//  NavCtrl
//
//  Created by Louis Harris on 3/1/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "AddCompanyVC.h"

@interface AddCompanyVC ()

@end

@implementation AddCompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNewCompany)];
    self.dao = [DAO sharedManager];
    self.title = @"New Company";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goBack
{
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)saveNewCompany
{
    if(self.companyNameTextField.hasText && self.companyPicTextField.hasText && self.companyStockTxtField.hasText)
    {
        //call dao that calls company class add new company to mutablearray
        Company *newlyAddedCompany = [[Company alloc] initWithCompany:self.companyNameTextField.text andLogo:self.companyPicTextField.text andStockSymbol:self.companyStockTxtField.text];
        [self.dao insertNewCompany:newlyAddedCompany];
        NSLog(@"saved");
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_companyNameTextField release];
    [_companyPicTextField release];
    [_companyStockTxtField release];
    [super dealloc];
}
@end
