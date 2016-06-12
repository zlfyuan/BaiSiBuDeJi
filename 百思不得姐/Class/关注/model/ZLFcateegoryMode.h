//
//  ZLFcateegoryMode.h
//  百思不得姐
//
//  Created by zluof on 16/6/7.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLFcateegoryMode : NSObject
/**name*/
@property (nonatomic,copy)NSString *name;

/**id*/
@property (nonatomic, assign)NSInteger id;

/**count*/
@property (nonatomic, assign)NSInteger count;

/**这个类别对应的用户数据类型*/
@property (nonatomic, strong)NSMutableArray *users;
/**总页数*/
@property (nonatomic, assign)NSInteger total_page;

/**总数*/
@property (nonatomic, assign)NSInteger total;

/**当前页数*/
@property (nonatomic, assign)NSInteger current_page;
@end
