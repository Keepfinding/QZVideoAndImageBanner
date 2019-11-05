//
//  QZVideoModel.h
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZVideoModel : NSObject
@property (nonatomic, copy  ) NSString *imgUrl;
@property (nonatomic, copy  ) NSString *videoUrl;
@property (nonatomic, assign) BOOL display;// 0 :图片 1：视频
@end

NS_ASSUME_NONNULL_END
