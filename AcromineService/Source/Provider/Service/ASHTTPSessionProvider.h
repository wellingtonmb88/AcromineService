//
//  ACHTTPSessionProvider.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Reachability.h"

typedef void (^ASRequestOperationBlockSuccess) (NSURLSessionDataTask *task, id responseObject);
typedef void (^ASRequestOperationBlockFailure) (NSError *error);

@interface ASHTTPSessionProvider : AFHTTPSessionManager

@property (nonatomic) Reachability *internetReachability;

+ (instancetype)sharedInstance;
- (NSString *)getEndPoint;
- (BOOL) checkConnection;

@end
