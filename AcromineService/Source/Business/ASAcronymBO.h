//
//  ASAcronymSearchBO.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASAcronym.h"

@interface ASAcronymBO : NSObject

+ (void)searchWithAcronym:(NSString *)acronym
                  success:(void(^)(ASAcronym *acronym))success
                  failure:(void(^)(NSError *error))failure;

@end
