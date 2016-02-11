//
//  TestUtils.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "TestUtils.h"

@implementation TestUtils

+ (void)initCoreData {
    [MagicalRecord cleanUp];
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelOff];
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

@end
