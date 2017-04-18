//
//  Product.m
//  NavCtrl
//
//  Created by Louis Harris on 2/27/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(id)initWithProduct:(NSString *)name andLogo:(NSString *)logo andURL:(NSString*)productURL
{
    self = [super init];
    if(self)
    {
        self.productName = name;
        self.productLogo = logo;
        self.productURL = productURL;
    }
    return self;
}

-(void)dealloc
{
    [_productName release];
    [_productLogo release];
    [_productURL release];
    [super dealloc];
}

@end
