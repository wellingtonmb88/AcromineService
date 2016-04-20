//
//  CITHTTPSessionProvider+AcronimeSearch.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASHTTPSessionProvider+AcronymSearch.h"

@implementation ASHTTPSessionProvider(AcronymSearch)

- (void)searchWithAcronym:(NSString *)acronym
                   success:(ASRequestOperationBlockSuccess)success
                   failure:(ASRequestOperationBlockFailure)failure{
    
    if([self checkConnection]){
    
         NSString *endpoint = [self getEndPoint];
         NSDictionary *parameters = @{@"sf": acronym};
        
        [self GET:endpoint parameters:parameters
            success:success
            failure:^(NSURLSessionDataTask *task, NSError *error) {
              
              NSLog(@"Request error: %@", error.description);
              failure(error);
          }];
    } else {
        failure(nil);
    }
}


@end
