//
//  Platform+CoreDataProperties.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 1/4/16.
//  Copyright © 2016 leonardobarros. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Platform.h"

NS_ASSUME_NONNULL_BEGIN

@interface Platform (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Session *> *sessions;

@end

@interface Platform (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(Session *)value;
- (void)removeSessionsObject:(Session *)value;
- (void)addSessions:(NSSet<Session *> *)values;
- (void)removeSessions:(NSSet<Session *> *)values;

@end

NS_ASSUME_NONNULL_END
