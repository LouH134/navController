//
//  DAO.h
//  NavCtrl
//
//  Created by Louis Harris on 3/1/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"
#import "ManagedCompany+CoreDataClass.h"
#import "ManagedCompany+CoreDataProperties.h"
#import "ManagedProduct+CoreDataClass.h"
#import "ManagedProduct+CoreDataProperties.h"
#import <CoreData/CoreData.h>

@protocol DAODelegate <NSObject>

-(void)stockPricesUpdated;

@end

@interface DAO : NSObject

@property (retain, nonatomic) NSMutableArray *companies;
@property (strong, atomic) id <DAODelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (retain, nonatomic) NSMutableArray* managedCompaniesArray;


+(id)sharedManager;

-(NSString*)getURLString;

-(void)getAPIData;

-(void)addCompany:(Company*) company;

-(void)addProduct:(Product*)product forCompany:(Company*)company;

-(void)deleteProduct:(Product*)product from:(Company*)company;

-(void)deleteCompany:(Company*)company;

-(void)modifyCompany:(Company*)currentCompany changeName:(NSString*)nameString andPic:(NSString*)picString;

-(void)modifyProduct:(Product*)currentProduct forCompany:(Company*) currentCompany withName:(NSString*)nameString andPic:(NSString*)pictureString andURL:(NSString*)urlString;

-(void)undoChanges;

-(void)redoChanges;


@end
