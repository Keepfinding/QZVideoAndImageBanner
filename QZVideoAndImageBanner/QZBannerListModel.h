//
//  QZBannerListModel.h
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import "QZVideoModel.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QZBannerListModel : NSObject
@property (nonatomic, copy  ) NSArray<QZVideoModel *> *items;
@end

NS_ASSUME_NONNULL_END
