//
//  JLStatusBarHUD.m
//  StatusBarHUD
//
//  Created by bp on 17/3/11.
//  Copyright © 2017年 junli. All rights reserved.
//

#import "JLStatusBarHUD.h"

@implementation JLStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;

+ (void)showWindow{
    
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH,[UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:0.25f animations:^{
        window_.frame = frame;
    }];
    
}
+ (void)showMessage:(NSString *)msg{
   
    [self showWindow];

    [self showWindow];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12.f];
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    


}

+ (void)showSuccess:(NSString *)msg{
    
    //NSLog(@"%@",NSTemporaryDirectory());
    [timer_ invalidate];
    
    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"StatusBarHUD.bundle/success"] forState:UIControlStateNormal];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12.f];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
+ (void)showError:(NSString *)msg{
    [timer_ invalidate];

    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"StatusBarHUD.bundle/error"] forState:UIControlStateNormal];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12.f];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.frame = window_.bounds;
    [window_ addSubview:button];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
+ (void)showLoading:(NSString *)msg{
    
    [timer_ invalidate];
    timer_ = nil;

    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12.f];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = window_.bounds;
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12.f]}].width;
    
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 -20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    
    
    loadView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadView];
    //timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

+ (void)hide{
    
    [UIView animateWithDuration:0.25f animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
    }];
}

@end
