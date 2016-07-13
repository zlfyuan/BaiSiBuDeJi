//
//  UIBarButtonItem+ZLFUIBarButton.h
//  百思不得姐
//
//  Created by zluof on 16/6/5.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZLFUIBarButton)

/**
 * 返回item
 * @param  image 正常图片
 * @param  heightimage 高亮图片
 * @param  target 方法对象
 * @param  action 点击事件
 * @return id
 */
+(instancetype)iteminitWithImage:(NSString *)image heightImage:(NSString *)heightimage target:(id)target action:(SEL)action;

@end
