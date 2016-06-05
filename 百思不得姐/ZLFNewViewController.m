//
//  ZLFNewViewController.m
//  百思不得姐
//
//  Created by zluof on 16/6/3.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFNewViewController.h"

@interface ZLFNewViewController ()

@end

@implementation ZLFNewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem iteminitWithImage:@"MainTagSubIcon" heightImage:@"MainTagSubIconClick" target:self action:@selector(tagButtonClicked)];
}

-(void)tagButtonClicked{
    ZLFNSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
