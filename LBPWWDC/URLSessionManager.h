//
//  URLSessionManager.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLSessionManager : NSURLSession

+ (instancetype)sharedInstance;

@end
