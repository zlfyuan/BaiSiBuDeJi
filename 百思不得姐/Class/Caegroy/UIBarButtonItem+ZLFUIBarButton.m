//
//  UIBarButtonItem+ZLFUIBarButton.m
//  百思不得姐
//
//  Created by zluof on 16/6/5.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "UIBarButtonItem+ZLFUIBarButton.h"

@implementation UIBarButtonItem (ZLFUIBarButton)

+(instancetype)iteminitWithImage:(NSString *)image heightImage:(NSString *)heightimage target:(id)target action:(SEL)action{
    UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Button setBackgroundImage:[UIImage imageNamed:heightimage] forState:UIControlStateHighlighted];
    Button.sizeV = Button.currentBackgroundImage.size;
    [Button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:Button];
}

@end
