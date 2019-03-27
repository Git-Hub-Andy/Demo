//
//  CollectionViewStyle.m
//  Test
//
//  Created by 袁志浦 on 2018/8/22.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import "CollectionViewStyle.h"

@implementation CollectionViewStyle

- (instancetype)init{
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
//        self.collectionCellNibName = @"UICollectionViewCell";
        self.collectionCellClass = [UICollectionViewCell class];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    }
    return self;
}

@end
