//
//  ASVariationObject.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import <Foundation/Foundation.h>

@interface ASVariationObject : NSObject

@property (copy, nonatomic) NSString *fullName;
@property (nonatomic) NSNumber *freq;
@property (nonatomic) NSNumber *since;

+ (instancetype)parseFromDictionary:(NSDictionary *)dictionary;

@end
