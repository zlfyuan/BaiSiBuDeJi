//
//  ZLFTabBar.m
//  百思不得姐
//
//  Created by zluof on 16/6/3.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFTabBar.h"

@interface ZLFTabBar ()
@property (nonatomic, strong)UIButton *publisBut;

@end

@implementation ZLFTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if ( self = [super initWithFrame:frame]) {
        UIButton *publishbut = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishbut setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishbut setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
      
        [self addSubview:publishbut];
        self.publisBut = publishbut;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.widthV;
    CGFloat height = self.heightV;
    self.publisBut.sizeV = self.publisBut.currentBackgroundImage.size;
    self.publisBut.center = CGPointMake(width*0.5,height*0.5);

    
    CGFloat butW = width/5;
    CGFloat butH = height;
    CGFloat butY = 0;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        
        if (![button isKindOfClass:[UIControl class]]||button == self.publisBut)
            continue;
        {
            CGFloat butX=  butW *(( index > 1) ? (index+1) : index);
            button.frame = CGRectMake(butX, butY, butW, butH);
            index ++;
        }
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
