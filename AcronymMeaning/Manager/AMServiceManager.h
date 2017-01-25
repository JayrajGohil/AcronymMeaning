//
//  AMServiceManager.h
//  AcronymMeaning
//
//  Created by Software Merchant on 1/25/17.
//  Copyright © 2017 Instock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AcronymResult.h"

typedef void (^ServiceSuccessBlock)(NSURLSessionDataTask *task, AcronymResult *acronymResult);
typedef void (^ServiceFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface AMServiceManager : NSObject

/*
 * @discussion
 * @return SingleTon instance of AMServiceManager
 */
+(AMServiceManager *)sharedManager;

/*
 * @discussion - This method makes a GET request to the given URL.
 * @param urlString url string of webservice
 * @parameters Dictionary of parameters to be sent
 * @success Successblock to be called on service success
 * @failure FailureBlock to be called on service failure
 *
 *  *** Sample usage ***
 * GET webservice : http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=usa
 * urlstring : http://www.nactem.ac.uk/software/acromine/dictionary.py?
 * parameters: @{@"sf": @"usa"}
 *
 */
- (void)getResponseForURLString:(NSString *)urlString parameters:(NSDictionary *)param success:(ServiceSuccessBlock) success failure:(ServiceFailureBlock) failure;

@end
