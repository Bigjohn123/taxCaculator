//
//  TaxFormView.m
//  TaxCaculater
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import "TaxFormView.h"

@implementation TaxFormView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setTypeName:(NSString *)typeName {
    [self.nameButton setTitle:typeName forState:UIControlStateNormal];
}

- (void)setPersonRate:(NSString *)personRate {
    [self.personRateButton setTitle:personRate forState:UIControlStateNormal];
}

- (void)setPersonFund:(NSString *)personFund {
    [self.personFundButton setTitle:personFund forState:UIControlStateNormal];
}

- (void)setCompanyRate:(NSString *)companyRate {
    [self.companyRateButton setTitle:companyRate forState:UIControlStateNormal];
}

- (void)setCompanyFund:(NSString *)companyFund {
    [self.companyFundButton setTitle:companyFund forState:UIControlStateNormal];
}

- (IBAction)changePersonRate:(id)sender {
    if ([self.delegate respondsToSelector:@selector(changePersonRate)]) {
        [self.delegate changePersonRate];
    }
}

- (IBAction)changePersonFund:(id)sender {
    
}

- (IBAction)changeCompanyRate:(id)sender {
    if ([self.delegate respondsToSelector:@selector(changeCompanyRate)]) {
        [self.delegate changeCompanyRate];
    }
}

- (IBAction)changeCompanyFund:(id)sender {
    
    
}





















@end
