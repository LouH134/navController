//
//  EditProductVC.m
//  NavCtrl
//
//  Created by Louis Harris on 3/9/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "EditProductVC.h"

@interface EditProductVC ()

@end

@implementation EditProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // setup navigation bar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveChanges)];
    self.title = @"Edit Product";
    //set up dao
    self.dao = [DAO sharedManager];
    
    //set up nsnotification center
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShowed:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHid:) name:UIKeyboardDidHideNotification object:nil];
    
    //keep track of y coordinates for properties
    self.productNameLabelCoordinate = self.productNameLabel.frame.origin.y;
    self.productNameTxtFieldCoordinate = self.editProductName.frame.origin.y;
    self.productPicLabelCoordinate = self.productPicLabel.frame.origin.y;
    self.productPicTxtFieldCoordinate = self.editProductPic.frame.origin.y;
    self.productURLLabelCoordinate = self.productURLLabel.frame.origin.y;
    self.productURLTxtFieldCoordinate = self.editProductURL.frame.origin.y;
    
}

-(void)keyboardShowed:(NSNotification*)notification
{
    [self goUp];
    
}

-(void)keyboardHid:(NSNotification*)notification
{
    [self goDown];
}

-(void)goUp
{
    //textfields move up
    CGRect newNameTextFieldFrame = self.editProductName.frame;
    CGRect newPicTextFieldFrame = self.editProductPic.frame;
    CGRect newURLTextFieldFrame = self.editProductURL.frame;
    
    newNameTextFieldFrame.origin.y = self.productNameTxtFieldCoordinate - 125;
    newPicTextFieldFrame.origin.y = self.productPicTxtFieldCoordinate - 115;
    newURLTextFieldFrame.origin.y = self.productURLTxtFieldCoordinate - 100;
    self.editProductName.frame = newNameTextFieldFrame;
    self.editProductPic.frame = newPicTextFieldFrame;
    self.editProductURL.frame = newURLTextFieldFrame;
    
    //move labels up
    CGRect newNameLabelFrame = self.productNameLabel.frame;
    CGRect newPicLabelFrame = self.productPicLabel.frame;
    CGRect newURLLabelFrame = self.productURLLabel.frame;
    
    newNameLabelFrame.origin.y = self.productNameLabelCoordinate - 130;
    newPicLabelFrame.origin.y = self.productPicLabelCoordinate - 120;
    newURLLabelFrame.origin.y = self.productURLLabelCoordinate - 110;
    self.productNameLabel.frame = newNameLabelFrame;
    self.productPicLabel.frame = newPicLabelFrame;
    self.productURLLabel.frame = newURLLabelFrame;
    
    
}

-(void)goDown
{
    //textfields move up
    CGRect newNameTextFieldFrame = self.editProductName.frame;
    CGRect newPicTextFieldFrame = self.editProductPic.frame;
    CGRect newURLTextFieldFrame = self.editProductURL.frame;
    
    newNameTextFieldFrame.origin.y = self.productNameTxtFieldCoordinate;
    newPicTextFieldFrame.origin.y = self.productPicTxtFieldCoordinate;
    newURLTextFieldFrame.origin.y = self.productURLTxtFieldCoordinate;
    self.editProductName.frame = newNameTextFieldFrame;
    self.editProductPic.frame = newPicTextFieldFrame;
    self.editProductURL.frame = newURLTextFieldFrame;
    
    //move labels up
    CGRect newNameLabelFrame = self.productNameLabel.frame;
    CGRect newPicLabelFrame = self.productPicLabel.frame;
    CGRect newURLLabelFrame = self.productURLLabel.frame;
    
    newNameLabelFrame.origin.y = self.productNameLabelCoordinate;
    newPicLabelFrame.origin.y = self.productPicLabelCoordinate;
    newURLLabelFrame.origin.y = self.productURLLabelCoordinate;
    self.productNameLabel.frame = newNameLabelFrame;
    self.productPicLabel.frame = newPicLabelFrame;
    self.productURLLabel.frame = newURLLabelFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.editProductName.text = self.currentProduct.productName;
    self.editProductPic.text = self.currentProduct.productLogo;
    self.editProductURL.text = self.currentProduct.productURL;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self goDown];
}

-(void)goBack
{
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
}
//create a save edits method
-(void)saveChanges
{
    if(self.editProductName.hasText && self.editProductPic.hasText && self.editProductURL.hasText)
    {
//        self.currentProduct.productName = self.editProductName.text;
//        self.currentProduct.productURL = self.editProductURL.text;
//        self.currentProduct.productLogo = self.editProductPic.text;
        
        [self.dao modifyProduct:self.currentProduct forCompany:self.currentCompany withName:self.editProductName.text andPic:self.editProductPic.text andURL:self.editProductURL.text];
        
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:YES];
    
    }
}


- (void)dealloc {
    [_editProductURL release];
    [_editProductName release];
    [_editProductPic release];
    [_productNameLabel release];
    [_productPicLabel release];
    [_productURLLabel release];
    [super dealloc];
}
@end
