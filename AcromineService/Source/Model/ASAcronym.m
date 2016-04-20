//
//  ASAcronym.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASAcronym.h"
#import "ASLongFormObject.h"

@implementation ASAcronym

#pragma mark - Inits

- (instancetype)initWithSearchResponse:(id)serviceResponse {
    if (self = [super init]) {
        [self parseFromResponse:serviceResponse];
    }
    
    return self;
}

#pragma mark - Parses

- (void)parseFromResponse:(id)response {
    
    if ([response count] < 1) {
        return;
    }
    
    NSDictionary *dictionaryObject = response[0];
    
    if ([dictionaryObject isKindOfClass:[NSDictionary class]]) {
        
        self.abbreviation = dictionaryObject[@"sf"];
        
        NSMutableArray *longFormObjectsArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *objects in dictionaryObject[@"lfs"]){ 
            ASLongFormObject *formObjects = [ASLongFormObject parseFromDictionary:objects];
            formObjects.abbreviation = self.abbreviation;
            [longFormObjectsArray addObject:formObjects];
        }
        
        self.longFormObjects = longFormObjectsArray;
    }
}

@end
