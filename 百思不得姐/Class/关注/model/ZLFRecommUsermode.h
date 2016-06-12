//
//  ZLFRecommUsermode.h
//  百思不得姐
//
//  Created by zluof on 16/6/8.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLFRecommUsermode : NSObject
/**name*/
@property (nonatomic,copy)NSString *screen_name;

/**粉丝数*/
@property (nonatomic, assign)NSInteger fans_count;

/**hearicon*/
@property (nonatomic,copy)NSString *header;


//introduction : ,
//uid : 18298176,
//header : http://wimg.spriteapp.cn/profile/large/2016/05/15/5737ed25d808b_mini.jpg,
//gender : 1,
//is_vip : 0,
//fans_count : 269,
//tiezi_count : 9,
//is_follow : 0,
//screen_name : 关东剧

@end
