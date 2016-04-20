//
//  ASLongFormObject.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import "ASLongFormObject.h"
#import "ASVariationObject.h"

@implementation ASLongFormObject

+ (instancetype)parseFromDictionary:(NSDictionary *)dictionary{
    ASLongFormObject *object = [ASLongFormObject new];
    object.fullName = dictionary[@"lf"];
    object.freq = dictionary[@"freq"];
    object.since = dictionary[@"since"];
    
    NSMutableArray *variationArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *objects in dictionary[@"vars"]){
        [variationArray addObject:[ASVariationObject parseFromDictionary:objects]];
    }
    
    object.variationObjects = variationArray;
    
    return object;
}
@end
