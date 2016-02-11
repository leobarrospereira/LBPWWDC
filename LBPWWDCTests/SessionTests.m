//
//  SessionTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "Session+Create.h"
#import "Platform.h"

SpecBegin(Session)

describe(@"Session", ^{
    
    beforeEach(^{
        [TestUtils initCoreData];
    });
    
    it(@"should create a session object", ^{
        NSDictionary *dict = @{@"date": @"2015-06-10",
                               @"description": @"Get more acquainted with iTunes Connect, your gateway to the App Store. Dive into unique services like TestFlight for beta testing and Transporter to help automate metadata setup for your apps. Discover the power of adding rich media to your app store page, the benefits of broadening your distribution path globally, and the abundance of help resources.",
                               @"focus": @[@"iOS", @"OS X", @"watchOS"],
                               @"id": @(304),
                               @"title": @"iTunes Connect: Development to Distribution",
                               @"track": @"Distribution",
                               @"images": @{@"hero": @"http://devstreaming.apple.com/videos/wwdc/2015/304ywrr62d/304/images/304_600x600.jpg",
                                            @"shelf": @"http://devstreaming.apple.com/videos/wwdc/2015/304ywrr62d/304/images/304_734x413.jpg",
                                            @"playback": @"http://devstreaming.apple.com/videos/wwdc/2015/304ywrr62d/304/images/304_220x220.jpg"},
                               @"year": @(2015),
                               @"url": @"http://devstreaming.apple.com/videos/wwdc/2015/304ywrr62d/304/hls_vod_mvp.m3u8"};
        
        Session *session = [Session createWithDictionary:dict inContext:[NSManagedObjectContext MR_defaultContext]];
        
        expect(session).notTo.beNil();
        expect(session.identifier).to.equal(dict[@"id"]);
        expect(session.sessionDescription).to.equal(dict[@"description"]);
        expect(session.title).to.equal(dict[@"title"]);
        expect(session.track).to.equal(dict[@"track"]);
        expect(session.year).to.equal(dict[@"year"]);
        expect(session.videoURL).to.equal(dict[@"url"]);
        expect(session.imageHeroURL).to.equal(dict[@"images"][@"hero"]);
        expect(session.imageShelfURL).to.equal(dict[@"images"][@"shelf"]);
        expect(session.imagePlaybackURL).to.equal(dict[@"images"][@"playback"]);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        expect([formatter stringFromDate:session.date]).to.equal(dict[@"date"]);
        
        NSArray *platforms = dict[@"focus"];
        for (Platform *platform in session.platforms.allObjects) {
            expect(platforms).to.contain(platform.name);
        }
    });
    
});

SpecEnd
