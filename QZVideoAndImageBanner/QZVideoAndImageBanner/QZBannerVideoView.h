//
//  QZBannerVideoView.h
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZBannerVideoView : UIView
// ******* 是否处于播放状态 ******
@property (nonatomic, assign) BOOL isPlay;
// ******* 视频播放地址 ******
@property (nonatomic, strong) NSString *videoUrl;
// ******* index 标记 ******
@property (nonatomic, assign) NSInteger index;
// **实例化方法
+ (instancetype)videoViewFrame:(CGRect)frame videoUrl:(NSString *)videoUrl;
/*
 * 开始播放
 */
- (void)start;

/*
 * 暂停播放
 */
- (void)stop;
@end

NS_ASSUME_NONNULL_END
