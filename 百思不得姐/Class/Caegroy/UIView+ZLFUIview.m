//
//  UIView+ZLFUIview.m
//  百思不得姐
//
//  Created by zluof on 16/6/5.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "UIView+ZLFUIview.h"

@implementation UIView (ZLFUIview)

-(void)setSizeV:(CGSize)sizeV{
    CGRect frame = self.frame;
    frame.size = sizeV;
    self.frame = frame;
}
-(CGSize)sizeV{
    return self.frame.size;
}

-(void)setWidthV:(CGFloat)widthV{
    CGRect frame = self.frame;
    frame.size.width = widthV;
    self.frame = frame;
}
-(CGFloat)widthV{
    return self.frame.size.width;
}

-(void)setHeightV:(CGFloat)heightV{
    CGRect frame = self.frame;
    frame.size.height = heightV;
    self.frame = frame;
}
-(CGFloat)heightV{
    return self.frame.size.height;
}

-(void)setXV:(CGFloat)xV{
    CGRect frame = self.frame;
    frame.origin.x = xV;
    self.frame = frame;
}
-(CGFloat)xV{
    
    return self.frame.origin.x;
}

-(void)setYV:(CGFloat)yV{
    
    CGRect frame = self.frame;
    frame.origin.y = yV;
    self.frame = frame;
}
-(CGFloat)yV{
    return self.frame.origin.y;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
    
}
-(CGFloat)centerX{
    return self.center.x;
}
-(void)setCenterY:(CGFloat)centerY{
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}
-(CGFloat)centerY{
    return self.center.y;
}

@end
