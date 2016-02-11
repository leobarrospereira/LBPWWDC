//
//  SessionViewModel.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@interface SessionViewModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sessionDescription;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *track;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *platforms;

- (instancetype)initWithModel:(Session *)session;

@end
