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
    self.dataManager = [DAO sharedManager];
    self.dataManager.delegate = self;
    
    
}

- (void)stockPricesUpdated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)checkEmpty
{
    if([self.dataManager.companies count] == 0)
    {
        [self.emptyView setHidden:NO];
        [self.tableView setHidden:YES];
    }else{
        [self.emptyView setHidden:YES];
        [self.tableView setHidden:NO];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    [self.dataManager getURLString];
    [self.dataManager getAPIData];
    [self checkEmpty];
    
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
    return [self.dataManager.companies count];
}

//creates cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Company *currCompany = [self.dataManager.companies objectAtIndex:[indexPath row]];
    // Configure the cell...
    cell.textLabel.text = currCompany.companyName;
    cell.detailTextLabel.text = currCompany.stockPrice;
    cell.imageView.image = [UIImage imageNamed:currCompany.companyLogo];
    
    
    
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Company *selectedCompany = [self.dataManager.companies objectAtIndex:indexPath.row];
        [self.dataManager deleteCompany:selectedCompany];
        [self checkEmpty];
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
     NSString* cellToMove = self.dataManager.companies[fromIndexPath.row];
     [self.dataManager.companies removeObjectAtIndex:fromIndexPath.row];
     [self.dataManager.companies insertObject:cellToMove atIndex:toIndexPath.row];
     
     [self.tableView reloadData];
 }

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Company* selectedCompany = [self.dataManager.companies objectAtIndex:[indexPath row]];
    
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

- (IBAction)unDo:(id)sender {
    [self.dataManager undoChanges];
    [self.tableView reloadData];
}

- (IBAction)reDo:(id)sender {
    [self.dataManager redoChanges];
    [self.tableView reloadData];
}
- (IBAction)addCompanyButton:(id)sender {
    AddCompanyVC* goToAddVC = [[AddCompanyVC alloc]init];
    [self.navigationController
     pushViewController:goToAddVC
     animated:YES];
}


- (void)dealloc {
    [_tableView release];
    [_emptyView release];
    [super dealloc];
}
@end
