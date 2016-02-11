//
//  SessionViewModel.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "SessionViewModel.h"
#import "Platform.h"

@implementation SessionViewModel

static NSDateFormatter *dateFormatter;

+ (NSDateFormatter *)formatter {
    if (dateFormatter) {
        return dateFormatter;
    }
    
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    dateFormatter.dateFormat = @"MMM dd, yyyy";
    return dateFormatter;
}

- (instancetype)initWithModel:(Session *)session {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.title = session.title;
    self.sessionDescription = session.sessionDescription;
    self.track = session.track;
    self.thumbUrl = session.imagePlaybackURL;
    self.videoUrl = session.videoURL;
    self.dateString = [[SessionViewModel formatter] stringFromDate:session.date];
    
    NSString *platforms = @"";
    if (session.platforms.allObjects.count > 0) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
        NSArray *platformsArray = [session.platforms.allObjects sortedArrayUsingDescriptors:@[sortDescriptor]];
        
        for (Platform *platform in platformsArray) {
            if ([platforms isEqualToString:@""]) {
                platforms = platform.name;
            } else {
                platforms = [NSString stringWithFormat:@"%@, %@", platforms, platform.name];
            }
        }
    }
    
    self.platforms = platforms;
    
    return self;
}

@end
