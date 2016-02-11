//
//  Session+Create.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "Session.h"

@interface Session (Create)

+ (Session *)createWithDictionary:(NSDictionary *)dict inContext:(NSManagedObjectContext *)moc;

@end
