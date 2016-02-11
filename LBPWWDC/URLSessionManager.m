//
//  URLSessionManager.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "URLSessionManager.h"

@implementation URLSessionManager

+ (instancetype)sharedInstance {
    static URLSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        [sessionConfig setHTTPAdditionalHeaders: @{@"Accept": @"application/json"}];
        
        sharedInstance = (URLSessionManager *)[NSURLSession sessionWithConfiguration:sessionConfig];
    });
    return sharedInstance;
}

@end
