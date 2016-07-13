//
//  ZLFPushView.m
//  百思不得姐
//
//  Created by zluof on 16/6/26.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFPushView.h"

@implementation ZLFPushView
+(void)show{
    //拿到版本号的key
    NSString *key = @"CFBundleShortVersionString";
    //当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    //沙盒里的版本号
    NSString *doucmentVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    if (![currentVersion isEqualToString:doucmentVersion]) {
        ZLFPushView *showView = [ZLFPushView pushView];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        showView.frame = window.frame;
        [window addSubview:showView];
        
        //储存当前版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        //立即储存
        [[NSUserDefaults standardUserDefaults]synchronize];
    }

}
- (IBAction)know:(id)sender {
    [self removeFromSuperview];
}
+(ZLFPushView *)pushView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
