//
//  ASVariationObject.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import "ASVariationObject.h"

@implementation ASVariationObject

+ (instancetype)parseFromDictionary:(NSDictionary *)dictionary{
    ASVariationObject *object = [ASVariationObject new];
    object.fullName = dictionary[@"lf"];
    object.freq = dictionary[@"freq"];
    object.since = dictionary[@"since"];
    
    return object;
}

@end
