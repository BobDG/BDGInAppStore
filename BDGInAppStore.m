//
//  BDGInAppStore.m
//  Analyzer
//
//  Created by Bob de Graaf on 19-01-15.
//  Copyright (c) 2015 GraafICT. All rights reserved.
//

#import <StoreKit/StoreKit.h>

#import "BDGInAppStore.h"

@interface BDGInAppStore () <SKStoreProductViewControllerDelegate>
{
    
}

@end

@implementation BDGInAppStore

#pragma Public methods

-(void)showAppWithinApp:(NSString *)appStoreID affiliateID:(NSString *)affiliateID campaignToken:(NSString *)campaignToken success:(void (^)(UIViewController *viewController))success failure:(void (^)(NSError *error))failure
{
    //Parameters
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    //AppStoreID
    parameters[SKStoreProductParameterITunesItemIdentifier] = appStoreID;
    
    //AffiliateID (from iOS8 and higher)
    if(affiliateID.length && [[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        parameters[SKStoreProductParameterAffiliateToken] = affiliateID;
        //CampaignToken
        if(campaignToken.length) {
            parameters[SKStoreProductParameterCampaignToken] = campaignToken;
        }
    }
    
    //SKStoreProductViewController
    SKStoreProductViewController *storeProductViewController = [SKStoreProductViewController new];
    storeProductViewController.delegate = self;
    [storeProductViewController loadProductWithParameters:parameters completionBlock:^(BOOL result, NSError *error) {
        if(error) {
            NSLog(@"BDGInAppStore error: %@, User Info %@", [error description], [error userInfo]);
            failure(error);
        }
        else {
            success(storeProductViewController);
        }
    }];
}

-(void)showAppInAppStoreApp:(NSString *)appStoreID affiliateID:(NSString *)affiliateID campaignToken:(NSString *)campaignToken
{
    //AppStore URL
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/app/id%@", appStoreID];
    
    //AffiliateID
    if(affiliateID.length>0) {
        urlStr = [urlStr stringByAppendingFormat:@"?at=%@", affiliateID];
        //CampaignToken
        if(campaignToken.length) {
            urlStr = [urlStr stringByAppendingFormat:@"&ct=%@", campaignToken];
        }
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}
                                                                
#pragma mark SKStoreProductViewControllerDelegate methods
                                                                
-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [viewController dismissViewControllerAnimated:TRUE completion:nil];
}

#pragma mark Singleton
                                                                
+(id)sharedBDGInAppStore
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
