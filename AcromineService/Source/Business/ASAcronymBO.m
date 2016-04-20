//
//  ASAcronymSearchBO.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASAcronymBO.h"
#import "ASHTTPSessionProvider+AcronymSearch.h"

@implementation ASAcronymBO

#pragma mark - Services

+ (void)searchWithAcronym:(NSString *)acronym
                  success:(void(^)(ASAcronym *acronym))success
                  failure:(void(^)(NSError *error))failure {
    
    ASHTTPSessionProvider *sessionManager = [ASHTTPSessionProvider sharedInstance];
    
    [sessionManager searchWithAcronym:acronym
                              success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"Search .with success");
         ASAcronym *acronymObject = [[ASAcronym alloc] initWithSearchResponse:responseObject];
         success(acronymObject);
         
     } failure:^(NSError *error) {
         
         NSLog(@"Error on Search."); 
         
         failure(error);
     }];
}

@end
