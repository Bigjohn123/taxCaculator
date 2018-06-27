//
//  TaxFormView.h
//  TaxCaculater
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TaxFormViewDelegate<NSObject>

- (void)changePersonRate;
- (void)changeCompanyRate;


@end

@interface TaxFormView : UIView
@property (weak, nonatomic) IBOutlet UIButton *nameButton;
@property (weak, nonatomic) IBOutlet UIButton *personRateButton;
@property (weak, nonatomic) IBOutlet UIButton *personFundButton;
@property (weak, nonatomic) IBOutlet UIButton *companyRateButton;
@property (weak, nonatomic) IBOutlet UIButton *companyFundButton;

@property (nonatomic,weak) id<TaxFormViewDelegate> delegate;

@property(nonatomic,copy)NSString *typeName;
@property(nonatomic,copy)NSString *personRate;
@property(nonatomic,copy)NSString *personFund;
@property(nonatomic,copy)NSString *companyRate;
@property(nonatomic,copy)NSString *companyFund;

@end
