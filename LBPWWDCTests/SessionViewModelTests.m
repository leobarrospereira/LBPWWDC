//
//  SessionViewModelTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 1/4/16.
//  Copyright © 2016 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "SessionViewModel.h"
#import "Session.h"
#import "Platform.h"

SpecBegin(SessionViewModel)

describe(@"SessionViewModel", ^{
    
    beforeEach(^{
        [TestUtils initCoreData];
    });
    
    it(@"should create a session view model based on a session object", ^{
        Session * session = [Session MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
        session.identifier = @(1);
        session.title = @"Session 1";
        session.sessionDescription = @"Description";
        session.track = @"Track A";
        session.imagePlaybackURL = @"www.image.url.com";
        session.videoURL = @"www.video.url.com";
        session.date = [NSDate date];
        
        Platform *platform1 = [Platform MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
        platform1.name = @"iOS";
        [session addPlatformsObject:platform1];
        
        Platform *platform2 = [Platform MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
        platform2.name = @"OS X";
        [session addPlatformsObject:platform2];
        
        SessionViewModel *viewModel = [[SessionViewModel alloc] initWithModel:session];
        expect(viewModel).toNot.beNil();
        expect(viewModel.title).to.equal(session.title);
        expect(viewModel.sessionDescription).to.equal(session.sessionDescription);
        expect(viewModel.track).to.equal(session.track);
        expect(viewModel.thumbUrl).to.equal(session.imagePlaybackURL);
        expect(viewModel.videoUrl).to.equal(session.videoURL);
        expect(viewModel.platforms).to.equal([NSString stringWithFormat:@"%@, %@", platform1.name, platform2.name]);
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
        dateFormatter.dateFormat = @"MMM dd, yyyy";
        expect(viewModel.dateString).to.equal([dateFormatter stringFromDate:session.date]);
    });
    
});

SpecEnd
