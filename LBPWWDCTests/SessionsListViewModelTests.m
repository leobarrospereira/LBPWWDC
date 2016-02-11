//
//  SessionsListViewModelTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 1/4/16.
//  Copyright © 2016 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "SessionsListViewModel.h"
#import "Session.h"
#import "SessionViewModel.h"

SpecBegin(SessionsListViewModel)

describe(@"SessionsListViewModel", ^{
    
    beforeAll(^{
        [TestUtils initCoreData];
        NSManagedObjectContext *moc = [NSManagedObjectContext MR_defaultContext];
        
        Session *session1 = [Session MR_createEntityInContext:moc];
        session1.track = @"Track A";
        session1.identifier = @(1);
        session1.title = @"Session 1";
        session1.year = @(2015);
        
        Session *session2 = [Session MR_createEntityInContext:moc];
        session2.track = @"Track A";
        session2.identifier = @(2);
        session2.title = @"Session 2";
        session2.year = @(2015);
        
        Session *session3 = [Session MR_createEntityInContext:moc];
        session3.track = @"Track B";
        session3.identifier = @(3);
        session3.title = @"Session 3";
        session3.year = @(2015);
        
        [moc MR_saveToPersistentStoreAndWait];
    });
    
    it(@"should return correct number of sections", ^{
        SessionsListViewModel *viewModel = [[SessionsListViewModel alloc] init];
        expect([viewModel numberOfSections]).to.equal(2);
    });
    
    it(@"should return the correct number of items in section", ^{
        SessionsListViewModel *viewModel = [[SessionsListViewModel alloc] init];
        expect([viewModel numberOfItemsInSection:0]).to.equal(2);
        expect([viewModel numberOfItemsInSection:1]).to.equal(1);
    });
    
    it(@"should return the title of section", ^{
        SessionsListViewModel *viewModel = [[SessionsListViewModel alloc] init];
        expect([viewModel titleForSection:0]).to.equal(@"Track A");
        expect([viewModel titleForSection:1]).to.equal(@"Track B");
    });
    
    it(@"should return the correct object at index", ^{
        SessionsListViewModel *viewModel = [[SessionsListViewModel alloc] init];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        SessionViewModel *object = [viewModel objectAtIndexPath:indexPath];
        expect(object).toNot.beNil();
        expect(object.title).to.equal(@"Session 1");
        expect(object.track).to.equal(@"Track A");
    });
    
});

SpecEnd
