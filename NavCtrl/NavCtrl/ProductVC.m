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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.imageArray = @[@"Apple.png",@"Samsung.png",@"Google.png",@"Twitter.png"];
    self.appleProducts = [NSMutableArray arrayWithObjects:@"iPad", @"iPod Touch",@"iPhone", nil];
    self.samsungProducts = [NSMutableArray arrayWithObjects:@"Galaxy S4", @"Galaxy Note", @"Galaxy Tab",nil];
    self.googleProducts = [NSMutableArray arrayWithObjects:@"Google Pixel", @"Google Home",@"Google Chromecast",nil];
    self.twitterProducts = [NSMutableArray arrayWithObjects:@"Twitter Cards",@"Twitter Kit",@"TweetDeck",nil];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([self.title isEqualToString:@"Apple mobile devices"]) {
        self.products = self.appleProducts;
    }else if ([self.title isEqualToString:@"Samsung mobile devices"]) {
        self.products = self.samsungProducts;
    }else if ([self.title isEqualToString:@"Google mobile devices"]){
        self.products = self.googleProducts;
    }else if ([self.title isEqualToString:@"Twitter mobile devices"]){
        self.products = self.twitterProducts;
    }
    
    [self.tableView reloadData];
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
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    //cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    
    if([self.title isEqualToString:@"Apple mobile devices"])
    {
        cell.imageView.image = [UIImage imageNamed:self.imageArray[0]];
    }else if ([self.title isEqualToString:@"Samsung mobile devices"]){
        cell.imageView.image = [UIImage imageNamed:self.imageArray[1]];
    }else if ([self.title isEqualToString:@"Google mobile devices"]){
        cell.imageView.image = [UIImage imageNamed:self.imageArray[2]];
    }else {
        cell.imageView.image = [UIImage imageNamed:self.imageArray[3]];
    }
    
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
     
     [self.products removeObjectAtIndex:indexPath.row];
     
     if ([self.title isEqualToString:@"Apple mobile devices"]) {
         self.appleProducts = self.products;
     }else if ([self.title isEqualToString:@"Samsung mobile devices"]) {
         self.samsungProducts = self.products;
     }else if ([self.title isEqualToString:@"Google mobile devices"]){
         self.googleProducts = self.products;
     }else if ([self.title isEqualToString:@"Twitter mobile devices"]){
         self.twitterProducts = self.products;
     }
     
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if(editing){
        [self.tableView setEditing:YES];
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
 // Navigation logic may go here, for example:
 // Create the next view controller.
     self.detailViewController = [[WebViewController alloc] init];
     
     self.detailViewController.companyName = self.title;
     NSString *productName = self.products[indexPath.row];
     self.detailViewController.title = productName;
     self.detailViewController.productName = productName;
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:self.detailViewController animated:YES];
}
 
- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
