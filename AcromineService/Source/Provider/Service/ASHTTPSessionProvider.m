//
//  ACHTTPSessionProvider.m
//  
//
//  Created by WELLINGTON BARBOSA on 4/18/16.
//
//

#import "ASHTTPSessionProvider.h"

static NSString * const kBaseURL = @"http://www.nactem.ac.uk";
static NSString * const kEndPoint = @"/software/acromine/dictionary.py";

@implementation ASHTTPSessionProvider

#pragma mark - Singleton

+ (instancetype)sharedInstance {
    
    static ASHTTPSessionProvider * _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kBaseURL]; 
        _sharedInstance = [[ASHTTPSessionProvider alloc] initWithBaseURL:url];
    });
    
    return _sharedInstance;
}

#pragma mark - Override

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = 15; 
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    }
    
    return self;
}

- (NSString *) getEndPoint {
    return kEndPoint;
}

- (BOOL)checkConnection {
    BOOL reachable = FALSE;
    
    _internetReachability = [Reachability reachabilityForInternetConnection];
    [_internetReachability startNotifier];
    
    NetworkStatus remoteHostStatus = [_internetReachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable) {NSLog(@"NotReachable"); reachable = FALSE; }
    else if (remoteHostStatus == ReachableViaWiFi) {NSLog(@"ReachableViaWiFi"); reachable = TRUE; }
    else if (remoteHostStatus == ReachableViaWWAN) {NSLog(@"ReachableViaWWAN"); reachable = TRUE; }
    
    return reachable;
}

@end
