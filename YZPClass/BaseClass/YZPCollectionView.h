//
//  YZPCollectionView.h
//  FunyAlley
//
//  Created by 袁志浦 on 2018/8/21.
//  Copyright © 2018年 Daniel. All rights reserved.
//

typedef void(^DidSelectItem)(id model);

#import <UIKit/UIKit.h>

#import "CollectionViewStyle.h"

@interface UICollectionViewCell (Category)

- (void)configureDataWithModel:(id)model indexPath:(NSIndexPath *)indexPath;

@end




@interface YZPCollectionView : UIView

@property (nonatomic ,strong) NSMutableArray *dataSourceArray;

@property (nonatomic ,copy) DidSelectItem selectItem;

@property (nonatomic ,strong) CollectionViewStyle *style;

@end
