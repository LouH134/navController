//
//  CompanyVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "CompanyVC.h"


@interface CompanyVC ()

@end

@implementation CompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddVC)];
    self.productViewController = [[ProductVC alloc]init];
    self.title = @"Mobile device makers";

    
    //companies and products are only made once
    DAO *myDataManager = [DAO sharedManager];
    self.companyList = myDataManager.companies;
 
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)goToAddVC
{
    AddCompanyVC* goToAddVC = [[AddCompanyVC alloc]init];
    [self.navigationController
     pushViewController:goToAddVC
     animated:YES];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.companyList count];
}

//creates cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Company *currCompany = [self.companyList objectAtIndex:[indexPath row]];
    // Configure the cell...
    cell.textLabel.text = currCompany.companyName;
    cell.imageView.image = [UIImage imageNamed:currCompany.companyLogo];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.companyList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}

//turns editing mode on and allows for selection
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
     NSString* cellToMove = self.companyList[fromIndexPath.row];
     [self.companyList removeObjectAtIndex:fromIndexPath.row];
     [self.companyList insertObject:cellToMove atIndex:toIndexPath.row];
     
     [self.tableView reloadData];
 }

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Company* selectedCompany = [self.companyList objectAtIndex:[indexPath row]];
    
    if(self.editing == YES)
    {
        self.editCompany = [[EditCompanyVC alloc]init];
        self.editCompany.currentCompany = selectedCompany;
        [self.navigationController pushViewController:self.editCompany animated:YES];
    }else{
        self.productViewController.title = selectedCompany.companyName;
        self.productViewController.products = selectedCompany.productsArray;
        self.productViewController.currentCompany = selectedCompany;
        
        
        [self.navigationController
         pushViewController:self.productViewController
         animated:YES];
    }
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
    [_tableView release];
    [super dealloc];
}
@end
