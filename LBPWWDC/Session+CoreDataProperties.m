//
//  Session+CoreDataProperties.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Session+CoreDataProperties.h"

@implementation Session (CoreDataProperties)

@dynamic date;
@dynamic sessionDescription;
@dynamic identifier;
@dynamic title;
@dynamic track;
@dynamic year;
@dynamic imageHeroURL;
@dynamic imageShelfURL;
@dynamic imagePlaybackURL;
@dynamic videoURL;
@dynamic platforms;

@end
