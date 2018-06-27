//
//  PdCollectionViewImageSudokuLayout.m
//  Loopin
//
//  Created by light_bo on 2017/7/29.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//

#import "PdCollectionViewImageSudokuLayout.h"
#import "PdSudokuItemLayoutConfigurator.h"

@interface PdCollectionViewImageSudokuLayout ()

@property (nonatomic, strong) NSMutableArray *attrsArray;

@end



@implementation PdCollectionViewImageSudokuLayout


- (instancetype)init {
    self = [super init];
    if (self) {
        _attrsArray = [NSMutableArray new];
    }
    
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


- (void)prepareLayout {
    [super prepareLayout];
    
    
    //计算所有cell的属性
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attrsArray addObject:attrs];
    }
}


- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect )rect {
    return self.attrsArray;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger itemAmount = [self.collectionView numberOfItemsInSection:0];
    
    Class algorithmClass =  NSClassFromString([NSString stringWithFormat:@"PdSudokuItemLayoutAttributeAlgorithm%zd", itemAmount]);
    PdSudokuItemLayoutConfigurator *layoutConfigurator = [[PdSudokuItemLayoutConfigurator alloc] initWithAlgorithmStrategy:[algorithmClass new]];
    
    return [layoutConfigurator layoutConfigWithCollectionView:self indexPath:indexPath];
}



@end
