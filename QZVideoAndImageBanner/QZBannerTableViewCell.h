//
//  QZBannerTableViewCell.h
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QZBannerListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QZBannerTableViewCell : UITableViewCell
@property (nonatomic, strong) QZBannerListModel *model;
@property (nonatomic, assign) NSInteger row;
@end

NS_ASSUME_NONNULL_END
