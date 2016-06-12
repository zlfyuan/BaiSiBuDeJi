//
//  ZLFCategroyTableViewCell.m
//  百思不得姐
//
//  Created by zluof on 16/6/7.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFCategroyTableViewCell.h"
#import "ZLFcateegoryMode.h"
@interface ZLFCategroyTableViewCell  ()
@property (weak, nonatomic) IBOutlet UIView *splitLine;
@property (weak, nonatomic) IBOutlet UIView *indoerView;

@end

@implementation ZLFCategroyTableViewCell

-(void)setCategroyMode:(ZLFcateegoryMode *)categroyMode{
    _categroyMode = categroyMode;
     self.textLabel.text = self.categroyMode.name;
}
- (void)awakeFromNib {
    self.indoerView.backgroundColor = [UIColor redColor];
    self.backgroundColor = Color(244, 244, 244);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.indoerView.hidden = !selected;
    self.textLabel.textColor = selected ? self.indoerView.backgroundColor:Color(78, 78, 78);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.yV = 3;
    self.textLabel.heightV =self.contentView.heightV - 2*self.textLabel.yV;
}
@end
