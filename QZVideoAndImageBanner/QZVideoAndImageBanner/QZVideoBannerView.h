//
//  QZVideoBannerView.h
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QZBannerListModel.h"

NS_ASSUME_NONNULL_BEGIN
@class QZVideoBannerView;
@protocol QZVideoBannerViewDelegate <NSObject>
// 点击图片的代理
- (void)bannerView:(QZVideoBannerView *)bannerView tapActionWith:(QZVideoModel *)listModel;

@end
@interface QZVideoBannerView : UIView
@property (nonatomic, strong) QZBannerListModel *model;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, weak  ) id<QZVideoBannerViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
