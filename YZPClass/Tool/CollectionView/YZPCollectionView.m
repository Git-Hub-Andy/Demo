//
//  YZPCollectionView.m
//  FunyAlley
//
//  Created by 袁志浦 on 2018/8/21.
//  Copyright © 2018年 Daniel. All rights reserved.
//

#import "YZPCollectionView.h"

@implementation UICollectionViewCell (Category)

- (void)configureDataWithModel:(id)model indexPath:(NSIndexPath *)indexPath{
    
}
@end

@interface YZPCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation YZPCollectionView

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        flowLayout.itemSize = self.style.itemSize;;
        flowLayout.minimumLineSpacing = self.style.minimumLineSpacing;
        flowLayout.minimumInteritemSpacing = self.style.minimumInteritemSpacing;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.style.frame collectionViewLayout:flowLayout];
        if (self.style.collectionCellNibName) {
        [_collectionView registerNib:[UINib nibWithNibName:self.style.collectionCellNibName bundle:nil] forCellWithReuseIdentifier:self.style.collectionCellNibName];
        }else{
            [_collectionView registerClass:self.style.class forCellWithReuseIdentifier:NSStringFromClass(self.style.class)];
        }        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (void)setStyle:(CollectionViewStyle *)style{
    _style = style;
    [self addSubview:self.collectionView];
}

- (void)setDataSourceArray:(NSMutableArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (self.style.collectionCellNibName) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.style.collectionCellNibName forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.style.collectionCellClass) forIndexPath:indexPath];
    }
    [cell configureDataWithModel:self.dataSourceArray[indexPath.row] indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectItem) {
        _selectItem(self.dataSourceArray[indexPath.row]);
    }
}
@end
