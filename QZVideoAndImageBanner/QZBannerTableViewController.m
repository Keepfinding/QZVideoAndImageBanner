//
//  QZBannerTableViewController.m
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/4.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//

#import "QZBannerTableViewCell.h"
#import "QZBannerTableViewController.h"

@interface QZBannerTableViewController ()
@property (nonatomic, strong) NSMutableArray *datasource;
@end

@implementation QZBannerTableViewController

#pragma mark ————— 基础设置 —————
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[QZBannerTableViewCell class] forCellReuseIdentifier:NSStringFromClass([QZBannerTableViewCell class])];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 return self.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QZBannerTableViewCell  *cell      = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QZBannerTableViewCell class]) forIndexPath:indexPath];
    cell.row                          = indexPath.row;
    QZBannerListModel *listModel      = self.datasource[indexPath.row];
    cell.model                        = listModel;
    return cell;
}
- (NSMutableArray *)datasource {
    if (!_datasource) {
        NSMutableArray *datasource = [NSMutableArray array];
        {
            QZBannerListModel *listModel1 = [QZBannerListModel new];
            QZVideoModel * videoModel1 = [QZVideoModel new];
            videoModel1.imgUrl = @"1.jpg";
            
            QZVideoModel * videoModel2 = [QZVideoModel new];
            videoModel2.display  = YES;
            videoModel2.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
            
            listModel1.items = @[videoModel1,videoModel2];
            [datasource addObject:listModel1];
        }
        {
            QZBannerListModel *listModel1 = [QZBannerListModel new];
            QZVideoModel * videoModel1 = [QZVideoModel new];
            videoModel1.display  = YES;
            videoModel1.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
            
            QZVideoModel * videoModel2 = [QZVideoModel new];
            videoModel2.imgUrl = @"2.jpg";
            listModel1.items = @[videoModel1,videoModel2];
            [datasource addObject:listModel1];
        }
        {
            QZBannerListModel *listModel1 = [QZBannerListModel new];
            QZVideoModel * videoModel1 = [QZVideoModel new];
            videoModel1.display  = YES;
            videoModel1.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
            
            QZVideoModel * videoModel2 = [QZVideoModel new];
            videoModel2.imgUrl = @"2.jpg";
            
            listModel1.items = @[videoModel1,videoModel2];
            [datasource addObject:listModel1];
        }
        {
            QZBannerListModel *listModel1 = [QZBannerListModel new];
            QZVideoModel * videoModel1 = [QZVideoModel new];
            videoModel1.display  = YES;
            videoModel1.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
            
            QZVideoModel * videoModel2 = [QZVideoModel new];
            videoModel2.display  = YES;
            videoModel2.videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
            
            listModel1.items = @[videoModel1,videoModel2];
            [datasource addObject:listModel1];
        }
        {
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
            [datasource addObject:listModel1];
        }
        _datasource = datasource;
    }
    return _datasource;
}
- (void)dealloc {
    NSLog(@"视频列表释放le");
}
@end
