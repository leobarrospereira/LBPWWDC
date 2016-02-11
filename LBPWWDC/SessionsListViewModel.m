//
//  SessionsListViewModel.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "SessionsListViewModel.h"
#import "Session.h"

@interface SessionsListViewModel () <NSFetchedResultsControllerDelegate>

@end


@implementation SessionsListViewModel

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self.fetchedResultsController performFetch:nil];
    
    return self;
}


#pragma mark - FetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year = 2015"];
    _fetchedResultsController = [Session MR_fetchAllGroupedBy:@"track" withPredicate:predicate sortedBy:@"identifier" ascending:YES delegate:self];
    return _fetchedResultsController;
}

-(NSInteger)numberOfSections {
    return [[self.fetchedResultsController sections] count];
}

-(NSInteger)numberOfItemsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

-(NSString *)titleForSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return sectionInfo.name;
}

- (SessionViewModel *)objectAtIndexPath:(NSIndexPath *)indexPath {
    Session *session = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return [[SessionViewModel alloc] initWithModel:session];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    if ([self.delegate respondsToSelector:@selector(contentDidChange)]) {
        [self.delegate contentDidChange];
    }
}

@end
