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

@protocol DAODelegate <NSObject>

-(void)stockPricesUpdated;

@end

@interface DAO : NSObject

@property (retain, nonatomic) NSMutableArray *companies;
@property (strong, atomic) id<DAODelegate> delegate;

+(id)sharedManager;
-(void)insertNewCompany:(Company*)newCompany;
-(void)insertNewProduct:(Product*)newProduct forCompany:(Company*)currentCompany;
-(void)editCurrentCompany:(Company*)currentCompany changeName:(NSString*)nameString andPic:(NSString*)picString;
-(NSString*)getURLString;
-(void)getAPIData;
@end
