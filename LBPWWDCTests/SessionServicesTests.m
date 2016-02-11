//
//  SessionServicesTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "SessionServices.h"
#import "URLSessionManager.h"
#import "Session.h"

SpecBegin(SessionServices)

describe(@"SessionServices", ^{
    
    static NSInteger sessionsCountOnJson = 10;
    
    beforeEach(^{
        [TestUtils initCoreData];
    });
    
    it(@"should save session on core data", ^{
        waitUntil(^(DoneCallback done) {
            // Mock the request with a local json.
            id urlSessionMock = OCMPartialMock([URLSessionManager sharedInstance]);
            [[[urlSessionMock stub] andDo:^(NSInvocation *invocation) {
                void(^completionMock)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);
                
                // The completion block is the fourth parameter of the method. In Objective-C, the first two parameters passed to any function are ‘self’ and '_cmd'.
                [invocation getArgument:&completionMock atIndex:3];
                NSString *fileName = @"sessions.json";
                NSBundle *bundle = [NSBundle bundleForClass:[self class]];
                NSString *filePath = [bundle pathForResource:[fileName stringByDeletingPathExtension] ofType:[fileName pathExtension]];
                NSData *data = [NSData dataWithContentsOfFile:filePath];
                
                completionMock(data, nil, nil);
                
            }] dataTaskWithURL:[OCMArg any] completionHandler:[OCMArg any]];
            
            
            [SessionServices getSessionsWithCompletion:^(NSError *error) {
                expect(error).to.beNil();
                
                NSArray *sessions = [Session MR_findAllInContext:[NSManagedObjectContext MR_defaultContext]];
                expect(sessions.count).to.equal(sessionsCountOnJson);
                
                done();
            }];
        });
    });
    
});

SpecEnd
