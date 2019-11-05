//
//  QZBannerViewController.m
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/5.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import "QZVideoBannerView.h"
#import "QZBannerViewController.h"

@interface QZBannerViewController ()<QZVideoBannerViewDelegate>
@property (nonatomic, weak  ) QZVideoBannerView *bannerView;
@end

@implementation QZBannerViewController

#pragma mark ————— dele —————
- (void)bannerView:(QZVideoBannerView *)bannerView tapActionWith:(QZVideoModel *)listModel {
    NSLog(@"点击了img,执行代理方法");
}

#pragma mark ————— baseSetting —————
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeupUI];
    self.bannerView.model = [self dataMake];
}
- (void)makeupUI {
    self.view.backgroundColor = UIColor.whiteColor;
    self.bannerView.frame = CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width, 200);
}
- (QZBannerListModel *)dataMake {
    QZBannerListModel *listModel1 = [QZBannerListModel new];
    QZVideoModel * videoModel0 = [QZVideoModel new];
    videoModel0.imgUrl = @"3.jpg";
    
    QZVideoModel * videoModel4 = [QZVideoModel new];
    videoModel4.display  = YES;
    videoModel4.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    
    QZVideoModel * videoModel1 = [QZVideoModel new];
    videoModel1.imgUrl = @"1.jpg";
    
    QZVideoModel * videoModel2 = [QZVideoModel new];
    videoModel2.display  = YES;
    videoModel2.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    
    listModel1.items = @[videoModel0,videoModel4,videoModel0,videoModel2];
    return listModel1;
}

#pragma mark ————— lazyLoad —————
- (QZVideoBannerView *)bannerView {
    if (!_bannerView) {
        QZVideoBannerView *bannerView = [QZVideoBannerView new];
        bannerView.delegate = self;
        bannerView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:bannerView];
        _bannerView = bannerView;
    }
    return _bannerView;
}
- (void)dealloc {
    NSLog(@"vc释放le");
}
@end
