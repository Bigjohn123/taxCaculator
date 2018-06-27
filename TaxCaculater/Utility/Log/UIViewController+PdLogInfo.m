//
//  UIViewController+PdLogInfo.m
//  Loopin
//
//  Created by Paramida-Di on 17/8/23.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//打印视图控制器

#import "UIViewController+PdLogInfo.h"
#import <objc/runtime.h>
@implementation UIViewController (PdLogInfo)


+ (void)load {
    //1.获取viewWillAppear
    //2.建立LogViewWillAppear
    //3.互换方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(viewWillAppear:);
        SEL logSel = @selector(log_viewWillAppear:);
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method logMethod = class_getInstanceMethod([self class], logSel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(logMethod), method_getTypeEncoding(logMethod));
        if (isAdd) {
            class_replaceMethod(self, logSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        }
        else {
            method_exchangeImplementations(systemMethod, logMethod);
        }
    });
    
}

/**
 互换viewWillAppear方法，实现打印对应控制器功能，方便代码查找

 @param animated
 */
- (void)log_viewWillAppear:(BOOL)animated {
    [self log_viewWillAppear:animated];
    NSLog(@"^_^ %@ willAppear",[self class]);
}



@end
