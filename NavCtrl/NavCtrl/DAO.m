//
//  DAO.m
//  NavCtrl
//
//  Created by Louis Harris on 3/1/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "DAO.h"
#import "NavControllerAppDelegate.h"

@implementation DAO

#pragma mark -Initalize

+(id)sharedManager {
    static DAO *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        
        NavControllerAppDelegate *app = (NavControllerAppDelegate*)[[UIApplication sharedApplication] delegate];
        self.context = app.persistentContainer.viewContext;
        NSUndoManager *undoManager = [[NSUndoManager alloc] init];
        [self.context setUndoManager:undoManager];
        self.companies = [[NSMutableArray alloc] init];
        self.managedCompaniesArray = [[NSMutableArray alloc]init];

        [self fetchManagedCompanies];
        
        if([self.companies count] == 0)
        {
            [self createManagedCompanies];
        }
    }
    return self;
}

#pragma mark -companyObjects

-(Company*)apple
{
    Product* ipad = [[Product alloc]initWithProduct:@"iPad" andLogo:@"iPad.jpg" andURL:@"http://www.apple.com/ipad/"];
    Product* ipodTouch = [[Product alloc]initWithProduct:@"iPod Touch" andLogo:@"ipodtouch.png" andURL:@"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_164984361260_&cid=aos-us-kwgo-ipod--slid--product-"];
    Product* iphone = [[Product alloc]initWithProduct:@"iPhone" andLogo:@"iPhone.jpg" andURL:@"http://www.apple.com/iphone-7/?afid=p238%7Cs6HPNxDZt-dc_mtid_20925d2q39172_pcrid_167993804360&cid=wwa-us-kwgo-iphone-slid--"];
    
    Company* appleCompany = [[Company alloc]initWithCompany:@"Apple" andLogo:@"Apple.png" andStockSymbol:@"AAPL"];
    [appleCompany.productsArray addObject:ipad];
    [appleCompany.productsArray addObject:ipodTouch];
    [appleCompany.productsArray addObject:iphone];
    
    return appleCompany;
}

-(Company*)samsung
{
    Product* galaxys4 = [[Product alloc]initWithProduct:@"Galaxy S4" andLogo:@"GalaxyS4.jpg" andURL:@"https://www.amazon.com/Samsung-Galaxy-S4-Verizon-Wireless/dp/B00CRNW3ZI"];
    Product* galaxyNote = [[Product alloc]initWithProduct:@"Galaxy Note" andLogo:@"GalaxyNote.jpg" andURL:@"http://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb"];
    Product* galaxyTab = [[Product alloc]initWithProduct:@"Galaxy Tab" andLogo:@"GalaxyTab.jpg" andURL:@"http://www.samsung.com/us/explore/tab-s2-features-and-specs/?cid=ppc-?cid=ppc-"];
    
    
    
    Company* samsungCompany = [[Company alloc]initWithCompany:@"Samsung" andLogo:@"Samsung.png" andStockSymbol:@"SSNLF" ];
    [samsungCompany.productsArray addObject:galaxys4];
    [samsungCompany.productsArray addObject:galaxyNote];
    [samsungCompany.productsArray addObject:galaxyTab];
    
    return  samsungCompany;
}

-(Company*)google
{
    Product* googlePixel = [[Product alloc]initWithProduct:@"Google Pixel" andLogo:@"GooglePixel.jpg" andURL:@"https://madeby.google.com/phone/?utm_source=ads-en-ha-na-sem&utm_medium=text-both&ds_kid=43700014535357730&utm_content=new-dr-bkws&utm_campaign=pixel"];
    Product* googleHome = [[Product alloc]initWithProduct:@"Google Home" andLogo:@"GoogleHome.jpg" andURL:@"https://madeby.google.com/home/?utm_source=en-ha-na-sem&utm_medium=cpc&utm_campaign=googlehome"];
    Product* googleChromecast = [[Product alloc]initWithProduct:@"Google Chromecast" andLogo:@"Chromecast.jpg" andURL:@"https://www.google.com/chromecast/tv/explore/?utm_source=en-ha-na-sem&utm_medium=cpc&utm_content=bkws&utm_campaign=tv"];
    
    Company* googleCompany = [[Company alloc]initWithCompany:@"Google" andLogo:@"Google.png" andStockSymbol:@"GOOG"];
    [googleCompany.productsArray addObject:googlePixel];
    [googleCompany.productsArray addObject:googleHome];
    [googleCompany.productsArray addObject:googleChromecast];
    
    return googleCompany;
}

-(Company*)twitter
{
    Product* twitterCards = [[Product alloc]initWithProduct:@"Twitter Cards" andLogo:@"Twitter.png" andURL:@"https://dev.twitter.com/cards/overview"];
    Product* twitterKit = [[Product alloc]initWithProduct:@"Twitter Kit" andLogo:@"Twitter.png" andURL:@"https://fabric.io/kits/android/twitterkit"];
    Product* tweetDeck = [[Product alloc]initWithProduct:@"TweetDeck" andLogo:@"Twitter.png" andURL:@"https://tweetdeck.twitter.com/"];

    Company* twitterCompany = [[Company alloc]initWithCompany:@"Twitter" andLogo:@"Twitter.png"andStockSymbol:@"TWTR"];
    [twitterCompany.productsArray addObject:twitterCards];
    [twitterCompany.productsArray addObject:twitterKit];
    [twitterCompany.productsArray addObject:tweetDeck];
    
    return twitterCompany;
}

#pragma mark -manipulateObjects
//Find way to allow dao to see newly saved companies

-(void)insertNewCompany:(Company*)newCompany
{
    [self.companies addObject:newCompany];
}

//acess products array for currentCompany
-(void)insertNewProduct:(Product*)newProduct forCompany:(Company*)currentCompany
{
    [currentCompany.productsArray addObject:newProduct];
}

#pragma mark -API CALL
-(NSString*)getURLString
{
    //go through companies array looking at stocksymbol if the array isn't the last element add a '+' to urlstring else add '&f=sa' to urlstring
    NSMutableString *tempString = [NSMutableString string];
    for (int i = 0; i < [self.companies count]; i++) {
        Company *company = [self.companies objectAtIndex:i];
        [tempString appendString:company.stockSymbol];
       
        if (i != [self.companies count]-1) {
            [tempString appendString:@"+"];
        }
    }
    //get url as string
    NSString* urlString = [[NSString alloc] initWithFormat:@"http://finance.yahoo.com/d/quotes.csv?s=%@&f=a",tempString];
    
    NSLog(@"%@",urlString);
    return urlString;
    
}

//create method that starts a nsurlsession and prints data
-(void)getAPIData
{
    NSURLSessionConfiguration* defaultConfigObj = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObj delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL* url = [NSURL URLWithString:self.getURLString];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask* dataTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error)
                                      {
                                         
                                          if(error == nil)
                                          {
                                              NSLog(@"%@",data);
                                              NSString* myDataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                                              NSLog(@"%@", myDataString);
                                              NSArray *pricesArray = [myDataString componentsSeparatedByString:@"\n"];
                                              //loop through companies and assign each element in pricesAsrray to a company
                                              int i = 0;
                                              for (Company *thisCompany in self.companies) {
                                                  thisCompany.stockPrice = pricesArray[i];
                                                  i++;
                                              }
                                              [self.delegate stockPricesUpdated];
                                          }
                                          else
                                          {
                                              NSLog(@"%@",error);
                                          }
                                          NSLog(@"TEST");
                                      }];
    
    [dataTask resume];
    
}

#pragma mark - CoreData

//- (void)saveContext {
//    NSError *error = nil;
//    if ([self.context hasChanges] && ![self.context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}


-(void)createManagedCompanies
{
    //make companies and products here, assign them to dao "companies" property
    [self.companies addObject:[self apple]];
    [self.companies addObject:[self samsung]];
    [self.companies addObject:[self google]];
    [self.companies addObject:[self twitter]];
    
    //save companies and and products to core data
    for (Company *company in self.companies) {
        ManagedCompany *mC = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedCompany" inManagedObjectContext:self.context];
        mC.companyName = company.companyName;
        mC.companyLogo = company.companyLogo;
        mC.stockPrice = company.stockPrice;
        mC.stockSymbol = company.stockSymbol;
        [self.managedCompaniesArray addObject:mC];
        
        
        
        for (Product *prod in company.productsArray) {
            ManagedProduct *mP = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedProduct" inManagedObjectContext:self.context];
            mP.productName = prod.productName;
            mP.productLogo = prod.productLogo;
            mP.productURL = prod.productURL;
            mP.company = mC;
            [mC.products setByAddingObject:mP];
            
        }
    }
}

-(void)fetchManagedCompanies
{
    self.companies = [[NSMutableArray alloc] init];
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"ManagedCompany"];
    NSArray *results = [self.context executeFetchRequest:request error:nil];
    self.managedCompaniesArray = [NSMutableArray arrayWithArray:results];
    
    for(ManagedCompany* managedCompany in results)
    {
        Company *company = [[Company alloc] init];
        company.companyName = managedCompany.companyName;
        company.companyLogo = managedCompany.companyLogo;
        company.stockPrice = managedCompany.stockPrice;
        company.stockSymbol = managedCompany.stockSymbol;
        company.productsArray = [[NSMutableArray alloc] init];
        
        for (ManagedProduct *managedProduct in managedCompany.products) {
            //create nsobject products
            Product* product = [[Product alloc]init];
            product.productName = managedProduct.productName;
            product.productLogo = managedProduct.productLogo;
            product.productURL = managedProduct.productURL;
            
            [company.productsArray addObject:product];
        }
        [self.companies addObject:company];
    }
}

-(void)addCompany:(Company*) company{
    
    [self insertNewCompany:company];
    
    ManagedCompany *mC = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedCompany" inManagedObjectContext:self.context];
    mC.companyName = company.companyName;
    mC.companyLogo = company.companyLogo;
    mC.stockPrice = company.stockPrice;
    mC.stockSymbol = company.stockSymbol;
    [self.managedCompaniesArray addObject:mC];
}

-(void)deleteCompany:(Company*)company
{
    
    ManagedCompany* mC = [self.managedCompaniesArray objectAtIndex:[self.companies indexOfObject:company]];
    [self.companies removeObject:company];
    [self.context deleteObject:mC];
    [self.managedCompaniesArray removeObject:mC];
}

-(void)deleteProduct:(Product*)product from:(Company*)company
{
    ManagedCompany* mC = [self.managedCompaniesArray objectAtIndex:[self.companies indexOfObject:company]];
    
    [company.productsArray removeObject:product];
    
    ManagedProduct *mPToDelete;
    
    for (ManagedProduct *mP in mC.products) {
        if(mP.productName == product.productName){
            mPToDelete = mP;
        }
    }
    
    [mC removeProductsObject:mPToDelete];
}

-(void)addProduct:(Product*)product forCompany:(Company *)company
{
    [self insertNewProduct:product forCompany:company];
    
    ManagedCompany* mC = [self.managedCompaniesArray objectAtIndex:[self.companies indexOfObject:company]];
    
    for (Product *prod in company.productsArray) {
        ManagedProduct *mP = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedProduct" inManagedObjectContext:self.context];
        mP.productName = prod.productName;
        mP.productLogo = prod.productLogo;
        mP.productURL = prod.productURL;
        mP.company = mC;
        [mC.products setByAddingObject:mP];
    
    }
}

-(void)modifyCompany:(Company*)currentCompany changeName:(NSString*)nameString andPic:(NSString*)picString
{
    //take the currentcompany name and logo and put the new strings into them
    currentCompany.companyName = nameString;
    currentCompany.companyLogo = picString;
    
    //take the currentcompany with the new strings and put it into the managed company
    ManagedCompany* mC = [self.managedCompaniesArray objectAtIndex:[self.companies indexOfObject:currentCompany]];
    mC.companyName = currentCompany.companyName;
    mC.companyLogo = currentCompany.companyLogo;
}

-(void)modifyProduct:(Product*)currentProduct forCompany:(Company*) currentCompany withName:(NSString*)nameString andPic:(NSString*)pictureString andURL:(NSString*)urlString
{
    //take the current name, logo, url and change it to the newly edited one
    currentProduct.productName = nameString;
    currentProduct.productLogo = pictureString;
    currentProduct.productURL = urlString;
    
    //in coredata access the current company and then the products put the changes into the coredata products
    ManagedCompany* mC = [self.managedCompaniesArray objectAtIndex:[self.companies indexOfObject:currentCompany]];
    NSUInteger currentProductIndex = [currentCompany.productsArray indexOfObject:currentProduct];
    ManagedProduct *mp = [[mC.products allObjects] objectAtIndex:currentProductIndex];
    mp.productName = nameString;
    mp.productLogo = pictureString;
    mp.productURL = urlString;
}

-(void)undoChanges
{
    //create undo manager undo
    if (self.context.hasChanges) {
        
        [self.context.undoManager undo];
        [self fetchManagedCompanies];
    }
}

-(void)redoChanges
{
    if(self.context.hasChanges){
        [self.context redo];
        [self fetchManagedCompanies];
    }
    
}

@end
