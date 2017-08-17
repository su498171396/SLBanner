//
//  SLBannerView.h
//  SLBanner
//
//  Created by 苏磊 on 2017/8/17.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLBannerModel;
@protocol SLBannerViewDelegate;

@interface SLBannerView : UIView

@property (nonatomic, copy)NSArray *images;//图片数据数组
@property (nonatomic, assign) BOOL shouldAuto;//是否自动滑动，默认开启
@property (nonatomic, strong) UIImage *placeHolder;//默认图


@property (nonatomic, assign) NSTimeInterval autoScrollDelay;//自动滑动时间间隔，默认3s
@property (nonatomic, weak) id <SLBannerViewDelegate> delegate;//代理

/**
 初始化方法
 
 @param frame 控件frame
 @param images 需要展示的数据数组
 @return 返回实例对象
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images;

@end


@protocol SLBannerViewDelegate <NSObject>


/**
 点击图片代理方法
 
 @param scrollView 当前的轮播控件
 @param model 当前点击图片数据
 */
- (void)scrollView:(SLBannerView *)scrollView didSelectImageWithModel:(SLBannerModel *)model;



@end
