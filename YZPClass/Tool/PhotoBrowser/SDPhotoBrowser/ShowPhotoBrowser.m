//
//  ShowPhotoBrowser.m
//  Project
//
//  Created by 袁志浦 on 2018/9/17.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import "ShowPhotoBrowser.h"
#import "SDPhotoBrowser.h"

@interface ShowPhotoBrowser()<SDPhotoBrowserDelegate>
{
    NSArray *_imageViewArray;
    NSArray *_hdURLArray;
}
@end

@implementation ShowPhotoBrowser

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static ShowPhotoBrowser *instance;
    dispatch_once(&onceToken, ^{
        instance = [[ShowPhotoBrowser alloc] init];
    });
    return instance;
}

- (void)showPhotoBrowser:(UIView *)sourceImagesContainerView imageViews:(NSArray <UIImageView*>*)imageViews hdImageURL:(NSArray <NSString*>*)hdImageURL currentImageIndex:(NSInteger)currentImageIndex{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = sourceImagesContainerView;
    browser.imageCount = imageViews.count;
    browser.currentImageIndex = currentImageIndex;
    browser.delegate = self;
    [browser show];
    
    _imageViewArray = imageViews;
    _hdURLArray = hdImageURL;
}

- (void)showPhotoBrowser:(UIView *)sourceImagesContainerView imageViews:(NSArray <UIImageView*>*)imageViews currentImageIndex:(NSInteger)currentImageIndex{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = sourceImagesContainerView;
    browser.imageCount = imageViews.count;
    browser.currentImageIndex = currentImageIndex;
    browser.delegate = self;
    [browser show];
    
    _imageViewArray = imageViews;
}

#pragma mark - photobrowser代理方法

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{
    UIImageView *imageView = _imageViewArray[index];
    return imageView.image;
}


// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    if (_hdURLArray.count == 0) {
        return nil;
    }
    NSString *urlStr = _hdURLArray[index];
    return [NSURL URLWithString:urlStr];
}

@end
