//
//  PdSudokuItemLayoutConfigurator.h
//  Loopin
//
//  Created by light_bo on 2017/7/29.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UICollectionViewLayoutAttributes;
@class PdCollectionViewImageSudokuLayout;
@class PdSudokuItemLayoutAttributeAlgorithm;


@protocol PdSudokuItemLayoutAttributeAlgorithmProtocol <NSObject>

@required
- (UICollectionViewLayoutAttributes *)layoutConfigWithCollectionView:(PdCollectionViewImageSudokuLayout *)collectionViewSudokuLayout indexPath:(NSIndexPath *)indexPath;

@end




@interface PdSudokuItemLayoutConfigurator : NSObject <PdSudokuItemLayoutAttributeAlgorithmProtocol>

- (instancetype)initWithAlgorithmStrategy:(PdSudokuItemLayoutAttributeAlgorithm *)sudokuLayoutAlgorithm;

@end


//PdSudokuItemLayoutAttributeAlgorithm
@interface PdSudokuItemLayoutAttributeAlgorithm : NSObject <PdSudokuItemLayoutAttributeAlgorithmProtocol>
@end

//PdSudokuItemLayoutAttributeAlgorithm1
@interface PdSudokuItemLayoutAttributeAlgorithm1 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm2
@interface PdSudokuItemLayoutAttributeAlgorithm2 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm3
@interface PdSudokuItemLayoutAttributeAlgorithm3 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm4
@interface PdSudokuItemLayoutAttributeAlgorithm4 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm5
@interface PdSudokuItemLayoutAttributeAlgorithm5 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm6
@interface PdSudokuItemLayoutAttributeAlgorithm6 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm7
@interface PdSudokuItemLayoutAttributeAlgorithm7 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm8
@interface PdSudokuItemLayoutAttributeAlgorithm8 : PdSudokuItemLayoutAttributeAlgorithm
@end

//PdSudokuItemLayoutAttributeAlgorithm9
@interface PdSudokuItemLayoutAttributeAlgorithm9 : PdSudokuItemLayoutAttributeAlgorithm
@end



