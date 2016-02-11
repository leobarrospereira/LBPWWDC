//
//  Session+Create.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "Session+Create.h"
#import "JsonUtils.h"
#import "Platform+Create.h"

@implementation Session (Create)

+ (Session *)createWithDictionary:(NSDictionary *)dict inContext:(NSManagedObjectContext *)moc {
    NSNumber *sessionId = [JsonUtils numberFromObject:dict[@"id"]];
    NSNumber *sessionYear = [JsonUtils numberFromObject:dict[@"year"]];
    if (!sessionId || !sessionYear) {
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier = %@ AND year = %@", sessionId, sessionYear];
    Session *session = [Session MR_findFirstWithPredicate:predicate inContext:moc];
    if (!session) {
        session = [Session MR_createEntityInContext:moc];
        session.identifier = sessionId;
        session.year = sessionYear;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    session.date = [dateFormatter dateFromString:[JsonUtils stringFromObject:dict[@"date"]]];
    
    session.sessionDescription = [JsonUtils stringFromObject:dict[@"description"]];
    session.title = [JsonUtils stringFromObject:dict[@"title"]];
    session.track = [JsonUtils stringFromObject:dict[@"track"]];
    
    // Images.
    NSDictionary *imageDict = [JsonUtils dictionaryFromObject:dict[@"images"]];
    if (imageDict) {
        session.imageHeroURL = [JsonUtils stringFromObject:imageDict[@"hero"]];
        session.imageShelfURL = [JsonUtils stringFromObject:imageDict[@"shelf"]];
        session.imagePlaybackURL = [JsonUtils stringFromObject:imageDict[@"playback"]];
    }
    
    session.videoURL = [JsonUtils stringFromObject:dict[@"url"]];
    
    // Platforms.
    NSArray *platforms = [JsonUtils arrayFromObject:dict[@"focus"]];
    for (NSString *platformName in platforms) {
        Platform *platform = [Platform platformWithName:platformName inContext:moc];
        [session addPlatformsObject:platform];
    }
    
    return session;
}

@end
