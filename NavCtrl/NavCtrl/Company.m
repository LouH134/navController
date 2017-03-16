//
//  Company.m
//  NavCtrl
//
//  Created by Louis Harris on 2/27/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

-(id)initWithCompany:(NSString *)name andLogo:(NSString *)logo andProducts:(NSMutableArray*)products
{
    self = [super init];
    if(self)
    {
        self.companyName = name;
        self.companyLogo = logo;
        self.productsArray = products;
    }
    return self;
}

-(id)initWithCompany:(NSString*)name andLogo:(NSString*)logo{
    self = [super init];
    if(self)
    {
        self.companyName = name;
        self.companyLogo = logo;
        self.productsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
