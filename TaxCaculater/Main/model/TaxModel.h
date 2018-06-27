//
//  TaxModel.h
//  TaxCaculater
//
//  Created by admin on 2018/4/11.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonInsuranceModel.h"
#import "CompanyInsuranceModel.h"
@interface TaxModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)PersonInsuranceModel *personInsureModel;
@property(nonatomic,strong)CompanyInsuranceModel *companyInsureModel;
@property(nonatomic,copy)NSString *personTaxMoney;
@property(nonatomic,copy)NSString *personInsureMoney;
@property(nonatomic,copy)NSString *taxInTotal;
@property(nonatomic,copy)NSString *profitMoney;


@end
