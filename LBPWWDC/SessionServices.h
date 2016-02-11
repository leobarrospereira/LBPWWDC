//
//  SessionServices.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completionWithError)(NSError *error);

@interface SessionServices : NSObject

+ (NSURLSessionDataTask *)getSessionsWithCompletion:(completionWithError)completion;

@end
