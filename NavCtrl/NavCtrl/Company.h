//
//  Company.h
//  NavCtrl
//
//  Created by Louis Harris on 2/27/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Company : NSObject

@property (strong, nonatomic) NSString* companyName;
@property (strong, nonatomic) NSString* companyLogo;
@property (strong, nonatomic) NSMutableArray* productsArray;
@property (strong, nonatomic) NSString* stockSymbol;
@property (strong, nonatomic) NSString* stockPrice;


-(id)initWithCompany:(NSString*)name andLogo:(NSString*)logo andProducts:(NSMutableArray*)products;

-(id)initWithCompany:(NSString*)name andLogo:(NSString*)logo andStockSymbol:(NSString*)symbol;

- (void)dealloc;

@end

