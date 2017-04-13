//
//  EditCompanyVC.m
//  NavCtrl
//
//  Created by Louis Harris on 3/9/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "EditCompanyVC.h"

@interface EditCompanyVC ()

@end

@implementation EditCompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // set up navigation bar
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveChanges)];
    self.title = @"Edit Company";
    
    //get dao object
    self.dao = [DAO sharedManager];
    
    //set up nsnotification center
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShowed:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHid:) name:UIKeyboardDidHideNotification object:nil];
    
    //keep track of y coordinates
    self.nameLabelYCoordinate = self.changeCompanyName.frame.origin.y;
    self.nameTextFieldYCoordinate = self.companyNameTextField.frame.origin.y;
    self.picLabelYCoordinate = self.changeCompanyPic.frame.origin.y;
    self.picTextFieldYCoordinate = self.companyPicTextField.frame.origin.y;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)keyboardShowed:(NSNotification*)notification
{
    [self goUp];

}

-(void)goUp
{
    //textfields move up
    CGRect newNameTextFieldFrame = self.companyNameTextField.frame;
    CGRect newPicTextFieldFrame = self.companyPicTextField.frame;
    
    newNameTextFieldFrame.origin.y = self.nameTextFieldYCoordinate - 290;
    newPicTextFieldFrame.origin.y =  self.picTextFieldYCoordinate - 250;
    self.companyNameTextField.frame = newNameTextFieldFrame;
    self.companyPicTextField.frame = newPicTextFieldFrame;
    
    //move labels up
    CGRect newNameLabelFrame = self.changeCompanyName.frame;
    CGRect newPicLabelFrame = self.changeCompanyPic.frame;
    
    newNameLabelFrame.origin.y = self.nameLabelYCoordinate - 300;
    newPicLabelFrame.origin.y = self.picLabelYCoordinate - 265;
    self.changeCompanyName.frame = newNameLabelFrame;
    self.changeCompanyPic.frame = newPicLabelFrame;
}

-(void)keyboardHid:(NSNotification*)notification
{
    [self goDown];

}

-(void)goDown
{
    CGRect regularNameTextFieldFrame = self.companyNameTextField.frame;
    CGRect regularPicTextFieldFrame = self.companyPicTextField.frame;
    
    regularNameTextFieldFrame.origin.y = self.nameTextFieldYCoordinate;
    regularPicTextFieldFrame.origin.y = self.picTextFieldYCoordinate;
    self.companyNameTextField.frame = regularNameTextFieldFrame;
    self.companyPicTextField.frame = regularPicTextFieldFrame;
    
    CGRect regularNameLabelFrame = self.changeCompanyName.frame;
    CGRect regularPicLabelFrame = self.changeCompanyPic.frame;
    
    regularNameLabelFrame.origin.y = self.nameLabelYCoordinate;
    regularPicLabelFrame.origin.y = self.picLabelYCoordinate;
    self.changeCompanyName.frame = regularNameLabelFrame;
    self.changeCompanyPic.frame = regularPicLabelFrame;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.companyNameTextField.text = self.currentCompany.companyName;
    self.companyPicTextField.text = self.currentCompany.companyLogo;
}

-(void)goBack
{
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
}

-(void)saveChanges
{
    NSLog(@"saved");
    if(self.companyNameTextField.hasText && self.companyPicTextField.hasText)
    {
        //than currentcompanyname text is = companynametextfield
        self.currentCompany.companyName = self.companyNameTextField.text;
        //than currentcompanypic text is = companypictextfield
        self.currentCompany.companyLogo = self.companyPicTextField.text;
        //put the new strings into dao
        [self.dao modifyCompany:self.currentCompany changeName:self.companyNameTextField.text andPic:self.companyPicTextField.text];
        
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:YES];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self goDown];
}


- (void)dealloc {
    [_companyNameTextField release];
    [_companyPicTextField release];
    [_changeCompanyName release];
    [_changeCompanyPic release];
    [super dealloc];
}
@end
