//
//  JLStatusBarHUD.h
//  StatusBarHUD
//
//  Created by bp on 17/3/11.
//  Copyright © 2017年 junli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLStatusBarHUD : NSObject

+ (void)showMessage:(NSString *)msg;
+ (void)showSuccess:(NSString *)msg;
+ (void)showError:(NSString *)msg;
+ (void)showLoading:(NSString *)msg;
+ (void)hide;
@end
