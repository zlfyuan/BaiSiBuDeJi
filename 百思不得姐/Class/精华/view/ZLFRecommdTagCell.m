//
//  ZLFRecommdTagCell.m
//  百思不得姐
//
//  Created by zluof on 16/6/12.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFRecommdTagCell.h"
#import "ZLFTagsMode.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ZLFRecommdTagCell

-(void)setTagsRecommend:(ZLFTagsMode *)tagsRecommend{
    _tagsRecommend = tagsRecommend;
    
    
    [self.imageList sd_setImageWithURL:[NSURL URLWithString:tagsRecommend.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.nameLabel.text = tagsRecommend.theme_name;
    
    NSString *subcount = nil;
    if (tagsRecommend.sub_number > 10000) {
        subcount = [NSString stringWithFormat:@"%.1f万人订阅",tagsRecommend.sub_number/ 10000.0];
    }else{
        subcount = [NSString stringWithFormat:@"%zd人订阅",tagsRecommend.sub_number];
    }
    self.subCountLabel.text =subcount;
    
    

}

//重写frame，不管传进来的frame是什么，在这都会重新设置
-(void)setFrame:(CGRect)frame{

    frame.origin.x =7;
    frame.size.width -= 2*self.xV;
    frame.size.height -=1;
    [super setFrame:frame];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
