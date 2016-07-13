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




@end
