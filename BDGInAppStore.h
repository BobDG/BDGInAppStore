//
//  BDGInAppStore.h
//  Analyzer
//
//  Created by Bob de Graaf on 19-01-15.
//  Copyright (c) 2015 GraafICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BDGInAppStore : NSObject
{
    
}

-(void)showAppInAppStoreApp:(NSString *)appStoreID affiliateID:(NSString *)affiliateID campaignToken:(NSString *)campaignToken;
-(void)showAppWithinApp:(NSString *)appStoreID affiliateID:(NSString *)affiliateID campaignToken:(NSString *)campaignToken success:(void (^)(UIViewController *viewController))success failure:(void (^)(NSError *error))failure;

+(BDGInAppStore *)sharedBDGInAppStore;

@end