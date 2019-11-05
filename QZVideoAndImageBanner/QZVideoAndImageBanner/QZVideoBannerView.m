//
//  QZVideoBannerView.m
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import "QZVideoModel.h"
#import "QZVideoBannerView.h"
#import "QZBannerVideoView.h"

#define kSCREEN_W [UIScreen mainScreen].bounds.size.width
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kDelegateRespondsTo(f) [self.delegate respondsToSelector:@selector(f)]

@interface QZVideoBannerView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView   *scrollView;
@property (nonatomic, strong) UIPageControl  *pageControl;
@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, assign) NSInteger      numberOfPages;
@property (nonatomic, assign) NSInteger      currentPage;
@property (nonatomic, strong) NSMutableArray *isVideoArr;
@property (nonatomic, strong) NSTimer        *timer;
@end
@implementation QZVideoBannerView

#pragma mark ————— 交互 —————
- (void)tapAction:(UITapGestureRecognizer *)ges {
    if (kDelegateRespondsTo(bannerView:tapActionWith:)) {
        NSLog(@"点击了一个item,执行代理方法");
        [self.delegate bannerView:self tapActionWith:self.model.items[ges.view.tag - 200]];
    }
}

#pragma mark ————— 赋值 —————
- (void)setModel:(QZBannerListModel *)model {
    _model = model;
    self.numberOfPages = model.items.count;
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    // 每次刷新数据后先移除之前的标记
    [self.isVideoArr removeAllObjects];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * model.items.count, self.frame.size.height);
    for (NSInteger index = 0; index <= model.items.count; index ++) {
        QZVideoModel *videoModel = model.items[index % model.items.count];
        if (!videoModel.display) {// 如果有图片
            [self.isVideoArr addObject:@(NO)];
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width * index, 0, self.frame.size.width, self.frame.size.height)];
            img.tag = 200 + index;
            img.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [img addGestureRecognizer:tapGes];
            img.image = [UIImage imageNamed:videoModel.imgUrl];
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.clipsToBounds = YES;
            [self.scrollView addSubview:img];
        } else { // 否则是视频
            [self.isVideoArr addObject:@(YES)];
            QZBannerVideoView *videoView = [QZBannerVideoView videoViewFrame:CGRectMake(self.frame.size.width * index, 0, self.frame.size.width, self.frame.size.height) videoUrl:@""];
            videoView.index  = index;
            videoView.videoUrl = videoModel.videoUrl;
            videoView.tag      = 200 + index;
            [self.scrollView addSubview:videoView];
        }
    }
    if (self.numberOfPages) {
        self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    }
    [self scrollViewDidChangePage];
}
- (void)addUI {
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {};
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 200)];
    self.scrollView.scrollEnabled = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playEnd:) name:@"bannerVideoDidPlayEnd" object:nil];
}
- (void)playEnd:(NSNotification *)noti {
    NSLog(@"滚动到下一页");
    self.timer.fireDate = [NSDate date];
}
- (void)scroll2NextPage {
    if (self.currentPage < self.numberOfPages) {
        [self.scrollView setContentOffset:CGPointMake((self.currentPage + 1) * kSCREEN_W, 0) animated:YES];
    }
}
// 正常滚动到下一页执行这里
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        NSInteger currentPage = self.scrollView.contentOffset.x / kSCREEN_W;
        if (currentPage == self.model.items.count) {
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
            [self scrollViewDidChangePage];
        } else {
            [self scrollViewDidChangePage];
        }
    }
}
// 从最后一页跳转到第一页（无动画效果）执行这里
- (void)scrollViewDidChangePage {
    self.currentPage = self.scrollView.contentOffset.x / kSCREEN_W;
    // 滚动到下一页结束后判断是图片还是视频
    if ([self.isVideoArr[self.currentPage] boolValue]) {// 视频自动播放
        self.timer.fireDate = [NSDate distantFuture];
        // 取出videoView
        QZBannerVideoView *videoView = [self.scrollView viewWithTag:self.currentPage + 200];
        [videoView start];
    }
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addUI];
        self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(scroll2NextPage) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        self.timer.fireDate = [NSDate distantFuture];
    }
    return self;
}
- (NSMutableArray *)views {
    if (!_views) {
        NSMutableArray *views = [NSMutableArray array];
        _views = views;
    }
    return _views;
}
- (NSMutableArray *)isVideoArr {
    if (!_isVideoArr) {
        NSMutableArray *isVideoArr = [NSMutableArray array];
        _isVideoArr = isVideoArr;
    }
    return _isVideoArr;
}
- (void)dealloc {
    [kNotificationCenter removeObserver:self];
}
@end
