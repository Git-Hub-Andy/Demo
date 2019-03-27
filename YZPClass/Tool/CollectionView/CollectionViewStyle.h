//
//  CollectionViewStyle.h
//  Test
//
//  Created by 袁志浦 on 2018/8/22.
//  Copyright © 2018年 北京惠发科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CollectionViewStyle : NSObject

@property (nonatomic,assign) CGFloat minimumLineSpacing;

@property (nonatomic,assign) CGFloat minimumInteritemSpacing;

///默认为CGSizeMake([UIScreen mainScreen].bounds.size.width, 100)
@property (nonatomic,assign) CGSize itemSize;

//默认是：UICollectionViewScrollDirectionVertical
@property (nonatomic,assign) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic ,copy) NSString *collectionCellNibName;

@property (nonatomic ,assign) Class collectionCellClass;

@property (nonatomic ,assign) CGRect frame;

//@property (nonatomic,assign) CGSize headerReferenceSize;
//
//@property (nonatomic,assign) CGSize footerReferenceSize;

@end
