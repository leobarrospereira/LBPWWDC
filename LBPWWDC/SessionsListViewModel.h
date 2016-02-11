//
//  SessionsListViewModel.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionViewModel.h"

@protocol SessionsListViewModelDelegate <NSObject>
@optional
- (void)contentDidChange;
@end

@interface SessionsListViewModel : NSObject

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, weak) id <SessionsListViewModelDelegate> delegate;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (NSString *)titleForSection:(NSInteger)section;
- (SessionViewModel *)objectAtIndexPath:(NSIndexPath *)indexPath;

@end
