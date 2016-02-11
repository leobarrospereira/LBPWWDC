//
//  SessionServices.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "SessionServices.h"
#import "URLSessionManager.h"
#import "JsonUtils.h"
#import "Session+Create.h"

@implementation SessionServices

+ (NSURLSessionDataTask *)getSessionsWithCompletion:(completionWithError)completion {
    NSURL *url = [NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/wwdc-services/ftzj8e4h/6rsxhod7fvdtnjnmgsun/videos.json"];
    
    NSURLSessionDataTask *task = [[URLSessionManager sharedInstance] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(error);
            return;
        }
        
        NSManagedObjectContext *moc = [NSManagedObjectContext MR_contextWithParent:[NSManagedObjectContext MR_defaultContext]];
        [moc performBlock:^{
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (!jsonDict) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *errorMessage = @"Error on process JSON.";
                    NSError *error = [NSError errorWithDomain:@"br.com.leonardobarros.LBPWWDC" code:-1 userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
                    completion(error);
                });
                return;
            }
            
            NSArray *sessionsArray = [JsonUtils arrayFromObject:jsonDict[@"sessions"]];
            if (!sessionsArray) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *errorMessage = @"Error on get sessions information.";
                    NSError *error = [NSError errorWithDomain:@"br.com.leonardobarros.LBPWWDC" code:-1 userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
                    completion(error);
                });
                return;
            }
            
            for (NSDictionary *sessionDict in sessionsArray) {
                [Session createWithDictionary:sessionDict inContext:moc];
            }
            
            [moc MR_saveToPersistentStoreAndWait];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }];
    }];
    [task resume];
    return task;
}

@end
