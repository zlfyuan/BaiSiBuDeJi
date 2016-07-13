//
//  ZLFRecommdTagCell.h
//  百思不得姐
//
//  Created by zluof on 16/6/12.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLFTagsMode;
@interface ZLFRecommdTagCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageList;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subCountLabel;

/**模型数据*/
@property (nonatomic, strong)ZLFTagsMode *tagsRecommend;

@end
