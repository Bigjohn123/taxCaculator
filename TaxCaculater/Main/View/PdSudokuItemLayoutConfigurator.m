//
//  PdSudokuItemLayoutConfigurator.m
//  Loopin
//
//  Created by light_bo on 2017/7/29.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//

#import "PdSudokuItemLayoutConfigurator.h"
#import "PdCollectionViewImageSudokuLayout.h"

#pragma mark - PdSudokuItemLayoutConfigurator
@interface PdSudokuItemLayoutConfigurator ()

@property (nonatomic, strong) PdSudokuItemLayoutAttributeAlgorithm *sudokuLayoutAlgorithm;

@end

@implementation PdSudokuItemLayoutConfigurator

- (instancetype)initWithAlgorithmStrategy:(PdSudokuItemLayoutAttributeAlgorithm *)sudokuLayoutAlgorithm {
    self = [super init];
    if (self) {
        _sudokuLayoutAlgorithm = sudokuLayoutAlgorithm;
    }
    
    return self;
}

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    return [_sudokuLayoutAlgorithm layoutConfigWithCollectionView:collectionViewSudokuLayout indexPath:indexPath];
}

@end



#pragma mark - PdSudokuItemLayoutAttributeAlgorithm
@implementation PdSudokuItemLayoutAttributeAlgorithm

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end


#pragma mark - PdSudokuItemLayoutAttributeAlgorithm1
@implementation PdSudokuItemLayoutAttributeAlgorithm1

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    UICollectionView *collectionView = collectionViewSudokuLayout.collectionView;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(0, 0, collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right, collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom);
    
    return attrs;
}

@end




#pragma mark - PdSudokuItemLayoutAttributeAlgorithm2
@implementation PdSudokuItemLayoutAttributeAlgorithm2

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = (collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right - collectionViewSudokuLayout.columnMargin)/2;
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.frame = CGRectMake(indexPath.row * (width + collectionViewSudokuLayout.columnMargin), 0, width, collectionViewSudokuLayout.collectionView.height);
    
    return attrs;
}

@end



#pragma mark - PdSudokuItemLayoutAttributeAlgorithm3
@implementation PdSudokuItemLayoutAttributeAlgorithm3

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float halfWidth = (width - collectionViewSudokuLayout.columnMargin)/2;
    float topHeight = collectionViewSudokuLayout.collectionView.height * 0.57;
    float bottomHeight = collectionViewSudokuLayout.collectionView.height - topHeight;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    float x = (indexPath.row>1? 1: 0) * (halfWidth + collectionViewSudokuLayout.columnMargin);
    float y = (indexPath.row>0? 1: 0) * (topHeight + collectionViewSudokuLayout.rowMargin);
    float attrsWidth = indexPath.row > 0? halfWidth: width;
    float height = indexPath.row <= 0? topHeight: bottomHeight;
    
    
    attrs.frame = CGRectMake(x, y, attrsWidth, height);
    
    return attrs;
    
//    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
//    float leftWidth = (width - collectionViewSudokuLayout.columnMargin) * 2 / 3;
//    float rightWidth = (width - collectionViewSudokuLayout.columnMargin) / 3;
//    float height = collectionViewSudokuLayout.collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom;
//    float halfHeight = (height - collectionViewSudokuLayout.rowMargin) / 2;
//    
//    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    if (0 == indexPath.row) {
//        attrs.frame = CGRectMake(0, 0, leftWidth, height);
//    } else {
//        attrs.frame = CGRectMake(leftWidth + collectionViewSudokuLayout.columnMargin, (indexPath.row - 1) * (halfHeight + collectionViewSudokuLayout.rowMargin), rightWidth, halfHeight);
//    }
//    
//    return attrs;
}

@end



#pragma mark - PdSudokuItemLayoutAttributeAlgorithm4
@implementation PdSudokuItemLayoutAttributeAlgorithm4

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float halfWidth = (width - collectionViewSudokuLayout.columnMargin)/2;
    float height = collectionViewSudokuLayout.collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom;
    float halfHeight = (height - collectionViewSudokuLayout.rowMargin) / 2;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake((indexPath.row % 2) * (halfWidth + collectionViewSudokuLayout.columnMargin), (indexPath.row > 1? 1: 0) * (halfHeight+collectionViewSudokuLayout.rowMargin), halfWidth, halfHeight);
    
    return attrs;
}

@end


#pragma mark - PdSudokuItemLayoutAttributeAlgorithm5
@implementation PdSudokuItemLayoutAttributeAlgorithm5

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float halfWidth = (width - collectionViewSudokuLayout.columnMargin)/2;
    float oneThirdWidth = (width - collectionViewSudokuLayout.columnMargin * 2) / 3;
    float topHeight = collectionViewSudokuLayout.collectionView.height * 0.60;
    float bottomHeight = collectionViewSudokuLayout.collectionView.height - topHeight;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if (indexPath.row <= 1) {
        attrs.frame = CGRectMake(indexPath.row * (halfWidth + collectionViewSudokuLayout.columnMargin), 0, halfWidth, topHeight);
    } else {
        attrs.frame = CGRectMake((indexPath.row - 2) * (oneThirdWidth + collectionViewSudokuLayout.columnMargin), topHeight + collectionViewSudokuLayout.rowMargin, oneThirdWidth, bottomHeight);
    }
    
    
    return attrs;
}

@end


#pragma mark - PdSudokuItemLayoutAttributeAlgorithm6
@implementation PdSudokuItemLayoutAttributeAlgorithm6

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float oneThirdWidth = (width - collectionViewSudokuLayout.columnMargin * 2) / 3;
    float topLeftWidth = (width - collectionViewSudokuLayout.columnMargin) * 2 / 3 + 1;
    float topRightWidth = (width - collectionViewSudokuLayout.columnMargin) / 3;
    
    float height = collectionViewSudokuLayout.collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom;
    float oneThirdHeight = (height - collectionViewSudokuLayout.rowMargin * 2) / 3;
    
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.row <= 2) {
        if (0 == indexPath.row) {
            attrs.frame = CGRectMake(0, 0, topLeftWidth, oneThirdHeight * 2 + collectionViewSudokuLayout.rowMargin);
        } else {
            attrs.frame = CGRectMake(topLeftWidth + collectionViewSudokuLayout.columnMargin, (indexPath.row - 1) * (oneThirdHeight + collectionViewSudokuLayout.rowMargin), topRightWidth, oneThirdHeight);
        }
    } else {
        attrs.frame = CGRectMake((indexPath.row - 3) * (oneThirdWidth + collectionViewSudokuLayout.columnMargin), oneThirdHeight * 2 + collectionViewSudokuLayout.rowMargin * 2, oneThirdWidth, oneThirdHeight);
    }
    
    return attrs;
}

@end



#pragma mark - PdSudokuItemLayoutAttributeAlgorithm7
@implementation PdSudokuItemLayoutAttributeAlgorithm7

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float oneThirdWidth = (width - collectionViewSudokuLayout.columnMargin * 2) / 3;
    float height = collectionViewSudokuLayout.collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom;
    float topHeight = height * 0.43;
    float bottomHeight = (height - topHeight - collectionViewSudokuLayout.rowMargin) / 2;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.row <= 0) {
        attrs.frame = CGRectMake(0, 0, width, topHeight - collectionViewSudokuLayout.rowMargin);
    } else {
        float x = ((indexPath.row-1) % 3) * (oneThirdWidth + collectionViewSudokuLayout.columnMargin);
        float y = topHeight + (bottomHeight + collectionViewSudokuLayout.rowMargin) * ((indexPath.row - 1) / 3);
        
        attrs.frame = CGRectMake(x, y, oneThirdWidth, bottomHeight);
    }
    
    return attrs;
}

@end


#pragma mark - PdSudokuItemLayoutAttributeAlgorithm8
@implementation PdSudokuItemLayoutAttributeAlgorithm8

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float halfWidth = (width - collectionViewSudokuLayout.columnMargin) / 2;
    float oneThirdWidth = (width - collectionViewSudokuLayout.columnMargin * 2) / 3;
    float height = collectionViewSudokuLayout.collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom;
    float topHeight = height * 0.43;
    float bottomHeight = (height - topHeight - collectionViewSudokuLayout.rowMargin) / 2;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.row <= 1) {
        attrs.frame = CGRectMake(indexPath.row * (halfWidth + collectionViewSudokuLayout.columnMargin), 0, halfWidth, topHeight - collectionViewSudokuLayout.rowMargin);
    } else {
        float x = ((indexPath.row-2) % 3) * (oneThirdWidth + collectionViewSudokuLayout.columnMargin);
        float y = topHeight + (bottomHeight + collectionViewSudokuLayout.rowMargin) * ((indexPath.row - 2) / 3);
        
        attrs.frame = CGRectMake(x, y, oneThirdWidth, bottomHeight);
    }
    
    return attrs;
}

@end



#pragma mark - PdSudokuItemLayoutAttributeAlgorithm9
@implementation PdSudokuItemLayoutAttributeAlgorithm9

- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath {
    float width = collectionViewSudokuLayout.collectionView.width - collectionViewSudokuLayout.sectionInset.left - collectionViewSudokuLayout.sectionInset.right;
    float oneThirdWidth = (width - collectionViewSudokuLayout.columnMargin * 2) / 3;
    float height = collectionViewSudokuLayout.collectionView.height - collectionViewSudokuLayout.sectionInset.top - collectionViewSudokuLayout.sectionInset.bottom;
    float oneThirdHeight = (height - collectionViewSudokuLayout.rowMargin * 2) / 3;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake((indexPath.row % 3) * (oneThirdWidth + collectionViewSudokuLayout.columnMargin), (indexPath.row / 3) * (oneThirdHeight + collectionViewSudokuLayout.rowMargin), oneThirdWidth, oneThirdHeight);
    
    return attrs;
}

@end






