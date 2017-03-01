//
//  DAO.m
//  NavCtrl
//
//  Created by Louis Harris on 3/1/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "DAO.h"

@implementation DAO

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
    if (self) {
        //make companies and products here, assign them to dao "companies" property
        self.companies = [[NSMutableArray alloc]init];
        [self.companies addObject:[self apple]];
        [self.companies addObject:[self samsung]];
        [self.companies addObject:[self google]];
        [self.companies addObject:[self twitter]];
    }
    return self;
}

-(Company*)apple
{
    Product* ipad = [[Product alloc]initWithProduct:@"iPad" andLogo:@"Apple.png" andURL:[NSURL URLWithString:@"http://www.apple.com/ipad/"]];
    Product* ipodTouch = [[Product alloc]initWithProduct:@"iPod Touch" andLogo:@"Apple.png" andURL:[NSURL URLWithString:@"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_164984361260_&cid=aos-us-kwgo-ipod--slid--product-"]];
    Product* iphone = [[Product alloc]initWithProduct:@"iPhone" andLogo:@"Apple.png" andURL:[NSURL URLWithString:@"http://www.apple.com/iphone-7/?afid=p238%7Cs6HPNxDZt-dc_mtid_20925d2q39172_pcrid_167993804360&cid=wwa-us-kwgo-iphone-slid--"]];
    
    NSMutableArray* appleProducts = [[NSMutableArray alloc]init];
    [appleProducts addObject:ipad];
    [appleProducts addObject:ipodTouch];
    [appleProducts addObject:iphone];
    
    Company* appleCompany = [[Company alloc]initWithCompany:@"Apple" andLogo:@"Apple.png" andProducts:appleProducts];
    return appleCompany;
}

-(Company*)samsung
{
    Product* galaxys4 = [[Product alloc]initWithProduct:@"Galaxy S4" andLogo:@"Samsung.png" andURL:[NSURL URLWithString:@"https://www.amazon.com/Samsung-Galaxy-S4-Verizon-Wireless/dp/B00CRNW3ZI"]];
    Product* galaxyNote = [[Product alloc]initWithProduct:@"Galaxy Note" andLogo:@"Samsung.png" andURL:[NSURL URLWithString:@"http://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb"]];
    Product* galaxyTab = [[Product alloc]initWithProduct:@"Galaxy Tab" andLogo:@"Samsung.png" andURL:[NSURL URLWithString:@"http://www.samsung.com/us/explore/tab-s2-features-and-specs/?cid=ppc-?cid=ppc-"]];
    
    NSMutableArray* samsungProducts = [[NSMutableArray alloc]init];
    [samsungProducts addObject:galaxys4];
    [samsungProducts addObject:galaxyNote];
    [samsungProducts addObject:galaxyTab];
    
    Company* samsungCompany = [[Company alloc]initWithCompany:@"Samsung" andLogo:@"Samsung.png" andProducts:samsungProducts];
    return  samsungCompany;
}

-(Company*)google
{
    Product* googlePixel = [[Product alloc]initWithProduct:@"Google Pixel" andLogo:@"Google.png" andURL:[NSURL URLWithString:@"https://madeby.google.com/phone/?utm_source=ads-en-ha-na-sem&utm_medium=text-both&ds_kid=43700014535357730&utm_content=new-dr-bkws&utm_campaign=pixel"]];
    Product* googleHome = [[Product alloc]initWithProduct:@"Google Home" andLogo:@"Google.png" andURL:[NSURL URLWithString:@"https://madeby.google.com/home/?utm_source=en-ha-na-sem&utm_medium=cpc&utm_campaign=googlehome"]];
    Product* googleChromecast = [[Product alloc]initWithProduct:@"Google Chromecast" andLogo:@"Google.png" andURL:[NSURL URLWithString:@"https://www.google.com/chromecast/tv/explore/?utm_source=en-ha-na-sem&utm_medium=cpc&utm_content=bkws&utm_campaign=tv"]];
    
    NSMutableArray* googleProducts = [[NSMutableArray alloc]init];
    [googleProducts addObject:googlePixel];
    [googleProducts addObject:googleHome];
    [googleProducts addObject:googleChromecast];
    
    Company* googleCompany = [[Company alloc]initWithCompany:@"Google" andLogo:@"Google.png" andProducts:googleProducts];
    return googleCompany;
}

-(Company*)twitter
{
    Product* twitterCards = [[Product alloc]initWithProduct:@"Twitter Cards" andLogo:@"Twitter.png" andURL:[NSURL URLWithString:@"https://dev.twitter.com/cards/overview"]];
    Product* twitterKit = [[Product alloc]initWithProduct:@"Twitter Kit" andLogo:@"Twitter.png" andURL:[NSURL URLWithString:@"https://fabric.io/kits/android/twitterkit"]];
    Product* tweetDeck = [[Product alloc]initWithProduct:@"TweetDeck" andLogo:@"Twitter.png" andURL:[NSURL URLWithString:@"https://tweetdeck.twitter.com/"]];
    
    NSMutableArray* twitterProducts = [[NSMutableArray alloc]init];
    [twitterProducts addObject:twitterCards];
    [twitterProducts addObject:twitterKit];
    [twitterProducts addObject:tweetDeck];
    
    Company* twitterCompany = [[Company alloc]initWithCompany:@"Twitter" andLogo:@"Twitter.png" andProducts:twitterProducts];
    return twitterCompany;
}

@end
