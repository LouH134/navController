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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.productViewController = [[ProductVC alloc]init];
    self.companyList = [[NSMutableArray alloc]initWithObjects:@"Apple", @"Samsung", @"Google", @"Twitter", nil];
    self.title = @"Mobile device makers";
    self.imageArray = [NSMutableArray arrayWithObjects: @"Apple.png",@"Samsung.png",@"Google.png",@"Twitter.png",nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.companyList objectAtIndex:[indexPath row]];
    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
     [self.companyList removeObjectAtIndex:indexPath.row];
     [self.imageArray removeObjectAtIndex:indexPath.row];
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     [tableView reloadData];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if(editing){
        [self.tableView setEditing:YES];
         //self.editButtonItem.title = NSLocalizedString(@"Done", @"Done");
       
    }else{
        [self.tableView setEditing:NO];
        //self.editButtonItem.title = NSLocalizedString(@"Edit", @"Edit");
    }

}
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     NSString* cellToMove = self.companyList[fromIndexPath.row];
     [self.companyList removeObjectAtIndex:fromIndexPath.row];
     [self.companyList insertObject:cellToMove atIndex:toIndexPath.row];
     
     NSString* cellToMoveImage = self.imageArray[fromIndexPath.row];
     [self.imageArray removeObjectAtIndex:fromIndexPath.row];
     [self.imageArray insertObject:cellToMoveImage atIndex:toIndexPath.row];
     [self.tableView reloadData];
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
    
    NSString *selectedCompany = [self.companyList objectAtIndex:indexPath.row];
    
    if ([selectedCompany isEqualToString:@"Apple"]){
        self.productViewController.title = @"Apple mobile devices";
    } else if ([selectedCompany isEqualToString:@"Samsung"]) {
        self.productViewController.title = @"Samsung mobile devices";
    }else if ([selectedCompany isEqualToString:@"Google"]){
        self.productViewController.title = @"Google mobile devices";
    }else if ([selectedCompany isEqualToString:@"Twitter"]){
        self.productViewController.title = @"Twitter mobile devices";
    }
    
    [self.navigationController
     pushViewController:self.productViewController
     animated:YES];
    
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
