//
//  ZLFRecommUserTableViewCell.m
//  百思不得姐
//
//  Created by zluof on 16/6/7.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFRecommUserTableViewCell.h"
#import "ZLFRecommUsermode.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ZLFRecommUserTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *heardImage;
@property (weak, nonatomic) IBOutlet UILabel *screnName;
@property (weak, nonatomic) IBOutlet UILabel *fansCount;
@end
@implementation ZLFRecommUserTableViewCell

-(void)setModeuser:(ZLFRecommUsermode *)modeuser{
    _modeuser = modeuser;
    self.screnName.text = modeuser.screen_name;
    
    NSString *fans = nil;
    if (modeuser.fans_count > 10000) {
        fans = [NSString stringWithFormat:@"%zd万人关注",modeuser.fans_count / 10000.0];
    }else{
        fans = [NSString stringWithFormat:@"%zd人关注",modeuser.fans_count];
    }
    self.fansCount.text =fans;
    [self.heardImage sd_setImageWithURL:[NSURL URLWithString:modeuser.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
}
- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
