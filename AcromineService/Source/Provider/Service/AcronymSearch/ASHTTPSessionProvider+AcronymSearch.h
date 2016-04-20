//
//  CITHTTPSessionProvider+AcronimeSearch.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//


#import "ASHTTPSessionProvider.h"

@interface ASHTTPSessionProvider (AcronymSearch)

- (void)searchWithAcronym:(NSString *)acronym
                  success:(ASRequestOperationBlockSuccess)success
                  failure:(ASRequestOperationBlockFailure)failure;

@end
