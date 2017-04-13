//
//  Product.h
//  NavCtrl
//
//  Created by Louis Harris on 2/27/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong,nonatomic)NSString* productName;
@property (strong, nonatomic)NSString* productLogo;
@property (strong, nonatomic)NSString* productURL;

-(id)initWithProduct:(NSString*)name andLogo: (NSString*)logo andURL:(NSString*)productURL;

@end
