//
//  SessionDetailsViewControllerTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 1/5/16.
//  Copyright © 2016 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "SessionDetailsViewController.h"
#import "SessionViewModel.h"
#import "Session.h"
#import "Platform.h"

@interface SessionDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackLabel;
@property (weak, nonatomic) IBOutlet UILabel *platformsLabel;
@property (weak, nonatomic) IBOutlet UILabel *sessionDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sessionImageView;

@end

SpecBegin(SessionDetailsViewController)

describe(@"SessionDetailsViewController", ^{
    __block SessionDetailsViewController *viewController;
    __block SessionViewModel *viewModel;
    
    beforeAll(^{
        [TestUtils initCoreData];
        
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
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        viewModel = [[SessionViewModel alloc] initWithModel:session];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        viewController = [storyboard instantiateViewControllerWithIdentifier:@"SessionDetailsViewController"];
        viewController.viewModel = viewModel;
        [UIApplication sharedApplication].keyWindow.rootViewController = viewController;
        [viewController view];
    });
    
    it(@"should load the view controller properties", ^{
        expect(viewController.titleLabel.text).to.equal(viewModel.title);
        expect(viewController.dateLabel.text).to.equal(viewModel.dateString);
        expect(viewController.trackLabel.text).to.equal(viewModel.track);
        expect(viewController.platformsLabel.text).to.equal(viewModel.platforms);
        expect(viewController.sessionDescriptionLabel.text).to.equal(viewModel.sessionDescription);
    });
    
});

SpecEnd
