//
//  SessionDetailsViewController.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 1/4/16.
//  Copyright © 2016 leonardobarros. All rights reserved.
//

#import "SessionDetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SessionDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackLabel;
@property (weak, nonatomic) IBOutlet UILabel *platformsLabel;
@property (weak, nonatomic) IBOutlet UILabel *sessionDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sessionImageView;

@end


@implementation SessionDetailsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Necessary to prevent offset scroll.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self loadSession];
}


#pragma mark - Load Session

- (void)loadSession {
    self.titleLabel.text = self.viewModel.title;
    self.dateLabel.text = self.viewModel.dateString;
    self.trackLabel.text = self.viewModel.track;
    self.sessionDescriptionLabel.text = self.viewModel.sessionDescription;
    self.platformsLabel.text = self.viewModel.platforms;
    [self.sessionImageView sd_setImageWithURL:[NSURL URLWithString:self.viewModel.thumbUrl]];
}


#pragma mark - Play Video

- (IBAction)playVideo:(id)sender {
    AVPlayerViewController *playerController = [AVPlayerViewController new];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:self.viewModel.videoUrl]];
    playerController.player = player;
    [self presentViewController:playerController animated:YES completion:^{
        [player play];
    }];
}

@end
