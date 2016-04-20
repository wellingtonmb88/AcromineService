//
//  ASBaseManager.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASBaseManager.h"

@implementation ASBaseManager

- (NSOperationQueue *)mainQueue {
    if (!_mainQueue) {
        _mainQueue = [NSOperationQueue new];
    }
    
    return _mainQueue;
}

@end
