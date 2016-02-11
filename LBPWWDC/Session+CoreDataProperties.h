//
//  Session+CoreDataProperties.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Session.h"

NS_ASSUME_NONNULL_BEGIN

@interface Session (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *sessionDescription;
@property (nullable, nonatomic, retain) NSNumber *identifier;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *track;
@property (nullable, nonatomic, retain) NSNumber *year;
@property (nullable, nonatomic, retain) NSString *imageHeroURL;
@property (nullable, nonatomic, retain) NSString *imageShelfURL;
@property (nullable, nonatomic, retain) NSString *imagePlaybackURL;
@property (nullable, nonatomic, retain) NSString *videoURL;
@property (nullable, nonatomic, retain) NSSet<Platform *> *platforms;

@end

@interface Session (CoreDataGeneratedAccessors)

- (void)addPlatformsObject:(Platform *)value;
- (void)removePlatformsObject:(Platform *)value;
- (void)addPlatforms:(NSSet<Platform *> *)values;
- (void)removePlatforms:(NSSet<Platform *> *)values;

@end

NS_ASSUME_NONNULL_END
