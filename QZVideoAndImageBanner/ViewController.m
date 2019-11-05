//
//  ViewController.m
//  QZVideoAndImageBanner
//
//  Created by Stephen Hu on 2019/11/1.
//  Copyright © 2019 Stephen Hu. All rights reserved.
//  千万记得设置ATS不然播放不出来

#import "ViewController.h"
#import "QZBannerViewController.h"
#import "QZBannerTableViewController.h"

@interface ViewController ()
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片和视频的轮播";
}
- (IBAction)buttonTaped:(UIButton *)sender {
    [self.navigationController pushViewController:[QZBannerTableViewController new] animated:YES];
}
- (IBAction)normalVcShow:(UIButton *)sender {
    [self.navigationController pushViewController:[QZBannerViewController new] animated:YES];
}

@end
