//
//  ProductVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "ProductVC.h"


@interface ProductVC ()

@end

@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToProductVC)];

    self.dataManager = [DAO sharedManager];
    
    
  
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    self.companyLogo.image = [UIImage imageNamed:self.currentCompany.companyLogo];
    self.companyTitle.text = self.currentCompany.companyName;
}

-(void)goBack
{
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
}

-(void)goToProductVC
{
    AddProductVC* goToProductVC = [[AddProductVC alloc]init];
    goToProductVC.currentCompany = self.currentCompany;
    [self.navigationController
     pushViewController:goToProductVC
     animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.currentCompany.productsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    Product* currentProduct = [self.currentCompany.productsArray objectAtIndex:[indexPath row]];
    cell.textLabel.text = currentProduct.productName;
    cell.imageView.image = [UIImage imageNamed:currentProduct.productLogo];
    
    return cell;
}

 // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
     Product* currentProduct = [self.currentCompany.productsArray objectAtIndex:[indexPath row]];
     [self.dataManager deleteProduct:currentProduct from:self.currentCompany];
     self.title = currentProduct.productName;
     [self.tableView reloadData];
 }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if(editing){
        [self.tableView setEditing:YES];
        [self.tableView setAllowsSelection:YES];
        [self.tableView setAllowsSelectionDuringEditing:YES];
    }else{
        [self.tableView setEditing:NO];
    }
    
}

 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     NSString* cellToMove = self.products[fromIndexPath.row];
     [self.products removeObjectAtIndex:fromIndexPath.row];
     [self.products insertObject:cellToMove atIndex:toIndexPath.row];
 }



 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }



 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 // Create the next view controller.
    self.detailViewController = [[WebViewController alloc] init];
    Product* currentProduct = [self.products objectAtIndex:[indexPath row]];

        self.detailViewController.companyName = self.title;
        self.detailViewController.title = currentProduct.productName;
        self.detailViewController.productName = currentProduct.productName;
        self.detailViewController.productURL = currentProduct.productURL;
        self.detailViewController.currentProduct = currentProduct;
        self.detailViewController.currentCompany = self.currentCompany;
    
        
        // Push the view controller.
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    
}
- (IBAction)addProduct:(id)sender {
    AddProductVC* goToProductVC = [[AddProductVC alloc]init];
    goToProductVC.currentCompany = self.currentCompany;
    [self.navigationController
     pushViewController:goToProductVC
     animated:YES];
}
 
- (void)dealloc {
    [_tableView release];
    [_companyLogo release];
    [_companyTitle release];
    [super dealloc];
}
@end
