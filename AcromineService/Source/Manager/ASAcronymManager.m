//
//  ASAcronymManager.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASAcronymManager.h"
#import "ASAcronymBO.h"

@implementation ASAcronymManager

- (void)searchWithAcronym:(NSString *)acronym
      withCompletionBlock:(void(^)(ASAcronym *acronym, BOOL success))completion {
    
    [self.mainQueue addOperationWithBlock:^{
        
        [ASAcronymBO searchWithAcronym:acronym
                               success:^(ASAcronym *acronym) {
                                   completion(acronym, YES);
                               } failure:^(NSError *error) {
                                   completion(nil, NO);
                               }]; 
    }];
}

@end
