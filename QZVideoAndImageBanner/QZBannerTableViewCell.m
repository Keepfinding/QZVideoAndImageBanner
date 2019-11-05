//
//  QZBannerTableViewCell.m
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import "QZVideoBannerView.h"
#import "QZBannerTableViewCell.h"

@interface QZBannerTableViewCell ()
@property (nonatomic, weak  ) QZVideoBannerView *bannerView;
@end
@implementation QZBannerTableViewCell

- (void)setModel:(QZBannerListModel *)model {
    _model = model;
    self.bannerView.row   = self.row;
    self.bannerView.model = model;
}
- (void)makeupUI {
    self.backgroundColor = [UIColor blueColor];
    self.bannerView.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 200);
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self makeupUI];
        NSLog(@"我会走几次");
    }
    return self;
}
- (QZVideoBannerView *)bannerView {
    if (!_bannerView) {
        QZVideoBannerView *bannerView = [QZVideoBannerView new];
        bannerView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:bannerView];
        _bannerView = bannerView;
    }
    return _bannerView;
}
@end
