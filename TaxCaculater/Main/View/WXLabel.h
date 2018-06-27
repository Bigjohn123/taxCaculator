//
//  WXLabel.h
//  TaxCaculater
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXLabel.h"

@protocol WXLabelDelegate <NSObject>

- (void)tapLabel:(UILabel *)label;

@end
@interface WXLabel : UILabel

@property (nonatomic,weak)id <WXLabelDelegate>delegate;

@end
