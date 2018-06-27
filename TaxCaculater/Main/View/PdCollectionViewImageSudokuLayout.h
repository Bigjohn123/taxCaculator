//
//  PdCollectionViewImageSudokuLayout.h
//  Loopin
//
//  Created by light_bo on 2017/7/29.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdCollectionViewImageSudokuLayout : UICollectionViewFlowLayout

/**
 每一列的间距
 */
@property (nonatomic, assign) float columnMargin;


/**
 每一行的间距
 */
@property (nonatomic, assign) float rowMargin;


@end
