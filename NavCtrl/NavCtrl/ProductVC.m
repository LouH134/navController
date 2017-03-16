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
    UIBarButtonItem* goToAddProducts = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToProductVC)];
    NSArray* rightSideButtons = @[self.editButtonItem, goToAddProducts];
    self.navigationItem.rightBarButtonItems = rightSideButtons;
  
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
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
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    Product* currentProduct = [self.products objectAtIndex:[indexPath row]];
    cell.textLabel.text = currentProduct.productName;
    cell.imageView.image = [UIImage imageNamed:currentProduct.productLogo];
    
    return cell;
}

 // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
     [self.products removeObjectAtIndex:indexPath.row];
     Product* currentProduct = [self.products objectAtIndex:[indexPath row]];
     self.title = currentProduct.productName;
     
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    
    if(self.editing == YES)
    {
        self.editProduct = [[EditProductVC alloc]init];
        self.editProduct.currentProduct = currentProduct;
        [self.navigationController pushViewController:self.editProduct animated:YES];
        
    }else{
        self.detailViewController.companyName = self.title;
        self.detailViewController.title = currentProduct.productName;
        self.detailViewController.productName = currentProduct.productName;
        self.detailViewController.productURL = currentProduct.productURL;
        
        // Push the view controller.
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
    
}
 
- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
