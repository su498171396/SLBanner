//
//  ViewController.m
//  SLBanner
//
//  Created by 苏磊 on 2017/8/17.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import "ViewController.h"
#import "SLBannerView.h"
#import "SLBannerModel.h"

@interface ViewController ()<SLBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBanner];
}


- (void)setUpBanner
{
    NSArray *urlsFirst = @[@"http://img.juimg.com/tuku/yulantu/121010/240425-12101021460537.jpg", @"http://pic.58pic.com/58pic/13/87/72/73t58PICjpT_1024.jpg", @"http://pic.58pic.com/58pic/13/46/13/86B58PIC5kQ_1024.jpg", @"http://images.takungpao.com/2015/0624/20150624025338794.jpg", @"http://pic.58pic.com/58pic/17/50/36/22758PICsYm_1024.jpg"];
    
    NSMutableArray *imagesFirst = [NSMutableArray array];
    for (int i = 0; i< 5; i++) {
        SLBannerModel *model = [[SLBannerModel alloc] init];
        model.imageUrl = urlsFirst[i];
        [imagesFirst addObject:model];
    }
    
    SLBannerView *bannerFirst = [[SLBannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) images:imagesFirst];
    bannerFirst.shouldAuto = YES; //是否自动轮播
    bannerFirst.autoScrollDelay = 3; //轮播时间间隔
    bannerFirst.delegate = self; //设置点击图片代理
   
    [self.view addSubview:bannerFirst];

    
    NSArray *urlsSecond = @[@"banner_0", @"banner_1", @"banner_2", @"banner_3", @"banner_4"];
   
    NSMutableArray *imagesSecond = [NSMutableArray array];
    for (int i = 0; i< 5; i++) {
        SLBannerModel *model = [[SLBannerModel alloc] init];
        model.imageUrl = urlsSecond[i];
        [imagesSecond addObject:model];
    }
   
    SLBannerView *bannerSecond = [[SLBannerView alloc] initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 200) images:imagesSecond];
    bannerSecond.delegate = self;
    
    [self.view addSubview:bannerSecond];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - YLBannerViewDelegate
- (void)scrollView:(SLBannerView *)scrollView didSelectImageWithModel:(SLBannerModel *)model
{
    NSLog(@"点击了%@",model);
}

@end
