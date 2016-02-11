//
//  PlatformTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "Platform+Create.h"

SpecBegin(Platform)

describe(@"Platform", ^{
    
    beforeEach(^{
        [TestUtils initCoreData];
    });
    
    it(@"should create a platform object", ^{
        NSString *platformName = @"iOS";
        Platform *platform = [Platform platformWithName:platformName inContext:[NSManagedObjectContext MR_defaultContext]];
        
        expect(platform).toNot.beNil();
        expect(platform.name).to.equal(platformName);
    });
    
});

SpecEnd
