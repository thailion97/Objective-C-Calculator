//
//  PlayVideoController.m
//  test
//
//  Created by Nguyen Anh Thai on 6/12/20.
//  Copyright © 2020 Nguyen Anh Thai. All rights reserved.
//

#import "PlayVideoController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PlayVideoController ()

@property (nonatomic) AVPlayer *player;
@property (weak, nonatomic) IBOutlet UIView *playerView;

@end

@implementation PlayVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"videodemo" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    self.player = [AVPlayer playerWithPlayerItem:playerItem];

    CALayer *superlayer = self.playerView.layer;
    self.player.volume = 1.0;

    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;// you can also use AVLayerVideoGravityResizeAspectFill
    playerLayer.frame = self.playerView.layer.bounds;

    [superlayer addSublayer:playerLayer];
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
