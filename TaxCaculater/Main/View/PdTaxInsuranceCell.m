//
//  PdTaxInsuranceCell.m
//  TaxCaculater
//
//  Created by admin on 2018/4/11.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import "PdTaxInsuranceCell.h"
#import "PersonInsuranceModel.h"
@interface PdTaxInsuranceCell()
<
WXLabelDelegate
>

@end
@implementation PdTaxInsuranceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.delegate = self;
    self.personRateLabel.delegate = self;
    self.companyRateLabel.delegate = self;
    self.personMoneyLabel.delegate = self;
    self.companyMoneyLabel.delegate = self;
    // Initialization code
}




- (void)setCellModel:(PersonInsuranceModel *)cellModel {
    self.nameLabel.text = cellModel.insuranceName;
    self.personRateLabel.text = cellModel.personRate;
    self.personMoneyLabel.text = cellModel.personFund;
    self.companyRateLabel.text = cellModel.companyRate;
    self.companyMoneyLabel.text = cellModel.companyFund;
    
}

#pragma mark --WXLabelDelegate 

- (void)tapLabel:(UILabel *)label {
    
}


@end
