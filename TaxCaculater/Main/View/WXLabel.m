//
//  WXLabel.m
//  TaxCaculater
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 flybearTech. All rights reserved.
//

#import "WXLabel.h"

@implementation WXLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initTapAction];
    }
    return self;
}

- (void)initTapAction {
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:tap];
}

- (void)onTap:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(tapLabel:)]) {
        [self.delegate tapLabel:self];
    }
    
}

@end
