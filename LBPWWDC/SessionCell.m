//
//  SessionCell.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "SessionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SessionCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;

@end

@implementation SessionCell

- (void)configureWithViewModel:(SessionViewModel *)viewModel {
    self.titleLabel.text = viewModel.title;
    self.dateLabel.text = viewModel.dateString;
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.thumbUrl]];
}

@end
