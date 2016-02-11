//
//  Platform+Create.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "Platform+Create.h"

@implementation Platform (Create)

+ (Platform *)platformWithName:(NSString *)name inContext:(NSManagedObjectContext *)moc {
    Platform *platform = [Platform MR_findFirstByAttribute:@"name" withValue:name inContext:moc];
    if (!platform) {
        platform = [Platform MR_createEntityInContext:moc];
        platform.name = name;
    }
    
    return platform;
}

@end
