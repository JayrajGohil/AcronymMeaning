//
//  AMServiceManager.m
//  AcronymMeaning
//
//  Created by Software Merchant on 1/25/17.
//  Copyright © 2017 Instock. All rights reserved.
//

#import "AMServiceManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AMConstants.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface AMServiceManager()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation AMServiceManager

+ (AMServiceManager *)sharedManager {
    static AMServiceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        // Setup a general API manager
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        // Enable the spinner in the status bar - to indicate network activity
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    }
    return self;
}

- (void)getResponseForURLString:(NSString *)urlString parameters:(NSDictionary *)param success:(ServiceSuccessBlock)success failure:(ServiceFailureBlock) failure
{
    
    // setup nil to content types
    self.manager.responseSerializer.acceptableContentTypes = nil;
    
    // GET response from url with parameter from AFNetworking and reply success or failure.
    [self.manager GET:urlString parameters:param progress:nil success:^(NSURLSessionDataTask *task, id responseObject){
        if (success) {
            AcronymResult *result = [[AcronymResult alloc] initWithDictionary:[responseObject firstObject]];
            success(task, result);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

@end
