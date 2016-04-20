//
//  ASLongFormObject.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import <Foundation/Foundation.h>

@interface ASLongFormObject : NSObject

@property (copy, nonatomic) NSString *abbreviation;
@property (copy, nonatomic) NSString *fullName;
@property (nonatomic) NSNumber *freq;
@property (nonatomic) NSNumber *since;
@property (copy, nonatomic) NSArray *variationObjects;

+ (instancetype)parseFromDictionary:(NSDictionary *)dictionary;

@end
