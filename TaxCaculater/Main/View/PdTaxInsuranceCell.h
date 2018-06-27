//
//  PdTaxInsuranceCell.h
//  TaxCaculater
//
//  Created by admin on 2018/4/11.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonInsuranceModel.h"
#import "WXLabel.h"
@interface PdTaxInsuranceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet WXLabel *nameLabel;
@property (weak, nonatomic) IBOutlet WXLabel *personRateLabel;
@property (weak, nonatomic) IBOutlet WXLabel *personMoneyLabel;
@property (weak, nonatomic) IBOutlet WXLabel *companyRateLabel;
@property (weak, nonatomic) IBOutlet WXLabel *companyMoneyLabel;

@property(nonatomic,strong)PersonInsuranceModel *cellModel;

@end
