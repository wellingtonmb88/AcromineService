//
//  ASAcronymManager.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import <Foundation/Foundation.h>
#import "ASBaseManager.h"
#import "ASAcronym.h"

@interface ASAcronymManager : ASBaseManager

- (void)searchWithAcronym:(NSString *)acronym
      withCompletionBlock:(void(^)(ASAcronym *acronym, BOOL success))completion;

@end
