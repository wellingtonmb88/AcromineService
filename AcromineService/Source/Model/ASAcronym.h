//
//  ASAcronym.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import <Foundation/Foundation.h>

@interface ASAcronym : NSObject

@property (copy, nonatomic) NSString *abbreviation;
@property (copy, nonatomic) NSArray *longFormObjects;

- (instancetype)initWithSearchResponse:(id)serviceResponse;

@end
