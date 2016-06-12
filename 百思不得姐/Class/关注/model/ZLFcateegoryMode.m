//
//  ZLFcateegoryMode.m
//  百思不得姐
//
//  Created by zluof on 16/6/7.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFcateegoryMode.h"

@implementation ZLFcateegoryMode
-(NSMutableArray *)users{
    if (_users==nil) {
        _users = [NSMutableArray new];
    }
    return _users;
}
@end
