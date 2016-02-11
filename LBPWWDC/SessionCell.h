//
//  SessionCell.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionViewModel.h"

@interface SessionCell : UITableViewCell

- (void)configureWithViewModel:(SessionViewModel *)viewModel;

@end
