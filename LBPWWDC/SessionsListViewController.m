//
//  SessionsListViewController.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "SessionsListViewController.h"
#import "SessionsListViewModel.h"
#import "SessionViewModel.h"
#import "SessionCell.h"
#import "SessionServices.h"
#import "SessionDetailsViewController.h"

@interface SessionsListViewController () <SessionsListViewModelDelegate>

@property (nonatomic, strong) SessionsListViewModel *viewModel;

@end

@implementation SessionsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[SessionsListViewModel alloc] init];
    self.viewModel.delegate = self;
    
    [SessionServices getSessionsWithCompletion:^(NSError *error) {
        if (error) {
            NSLog(@"Error - %@", error.localizedDescription);
        }
    }];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SessionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SessionCell" forIndexPath:indexPath];
    SessionViewModel *session = [self.viewModel objectAtIndexPath:indexPath];
    [cell configureWithViewModel:session];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.viewModel titleForSection:section];
}


#pragma mark - SessionsListViewModelDelegate

- (void)contentDidChange {
    [self.tableView reloadData];
}


#pragma mark - Refresh Control

- (IBAction)refreshView:(UIRefreshControl *)sender {
    [SessionServices getSessionsWithCompletion:^(NSError *error) {
        [sender endRefreshing];
        if (error) {
            NSLog(@"Error - %@", error.localizedDescription);
        }
    }];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SessionDetailsSegue"]) {
        if (![sender isKindOfClass:[UITableViewCell class]]) {
            return;
        }
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (!indexPath) {
            return;
        }
        
        SessionDetailsViewController *destination = segue.destinationViewController;
        if (![destination isKindOfClass:[SessionDetailsViewController class]]) {
            return;
        }
        
        SessionViewModel *viewModel = [self.viewModel objectAtIndexPath:indexPath];
        destination.viewModel = viewModel;
    }
}

@end
