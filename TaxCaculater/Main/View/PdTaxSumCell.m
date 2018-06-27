//
//  PdTaxSumCell.m
//  TaxCaculater
//
//  Created by admin on 2018/4/21.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import "PdTaxSumCell.h"
#import "PdIndividualTaxSumModel.h"
@implementation PdTaxSumCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.equalTo(@(Pd_Screen_width/5));
        }];
    }
    if (!_personTaxLabel) {
        _personTaxLabel = [[UILabel alloc] init];
        [self addSubview:_personTaxLabel];
        [_personTaxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.top.equalTo(self.mas_top);
            make.width.equalTo(@(Pd_Screen_width*2/5));
        }];
    }
    if (!_companyTaxLabel) {
        _companyTaxLabel = [[UILabel alloc] init];
        [self addSubview:_companyTaxLabel];
        [_companyTaxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_personTaxLabel.mas_right);
            make.right.equalTo(self.mas_right);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
        }];
    }
    
}

- (void)setCellModel:(PdIndividualTaxSumModel *)cellModel {
    _nameLabel.text = cellModel.taxSumName;
    _personTaxLabel.text = cellModel.taxSumPerson;
    _companyTaxLabel.text = cellModel.taxSumCompany;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
