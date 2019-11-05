//
//  QZBannerVideoView.m
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//


#import <AVKit/AVKit.h>
#import "QZBannerVideoView.h"
#import <AVFoundation/AVFoundation.h>

@interface QZBannerVideoView ()<AVPlayerViewControllerDelegate>
@property (nonatomic, strong) AVPlayerViewController *videoPlayer;
@end
@implementation QZBannerVideoView

#pragma mark ————— actions —————
- (void)start {
    [self.videoPlayer.player play];
}
- (void)stop {
    [self.videoPlayer.player pause];
}
+ (instancetype)videoViewFrame:(CGRect)frame videoUrl:(NSString *)videoUrl {
    QZBannerVideoView *videoView = [[self alloc] initWithFrame:frame];
    return videoView;
}
- (void)moviePlayDidEnd:(NSNotification *)noti {
    CMTime dragedCMTime = CMTimeMake(0, 1);
    [self.videoPlayer.player seekToTime:dragedCMTime toleranceBefore:CMTimeMake(1,1) toleranceAfter:CMTimeMake(1,1) completionHandler:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"bannerVideoDidPlayEnd" object:@(self.index)];
        NSLog(@"播放结束");
    }];
}
- (void)setVideoUrl:(NSString *)videoUrl {
    _videoUrl = videoUrl;
    [self loadUI];
}
- (void)loadUI {
    [self addSubview:self.videoPlayer.view];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.videoPlayer.player.currentItem];
}

#pragma mark ————— lazyLoad —————
- (AVPlayerViewController *)videoPlayer {
    if (!_videoPlayer) {
        _videoPlayer = [[AVPlayerViewController alloc]init];
        _videoPlayer.view.frame = self.bounds;
        _videoPlayer.view.backgroundColor = [UIColor whiteColor];
        _videoPlayer.delegate = self;
        _videoPlayer.showsPlaybackControls = NO;
        _videoPlayer.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.videoUrl]];
        _videoPlayer.player.muted = YES;
    }
    return _videoPlayer;
}
- (void)dealloc {
    [self stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.videoPlayer.player.currentItem];
}
@end
