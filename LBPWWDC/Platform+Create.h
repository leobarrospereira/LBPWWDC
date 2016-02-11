//
//  Platform+Create.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "Platform.h"

@interface Platform (Create)

+ (Platform *)platformWithName:(NSString *)name inContext:(NSManagedObjectContext *)moc;

@end
