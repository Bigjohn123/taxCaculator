//
//  PdTaxSumCell.h
//  TaxCaculater
//
//  Created by admin on 2018/4/21.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PdIndividualTaxSumModel;
@interface PdTaxSumCell : UITableViewCell

@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *personTaxLabel;
@property(nonatomic,strong)UILabel *companyTaxLabel;

@property(nonatomic,strong)PdIndividualTaxSumModel  *cellModel;
@end
