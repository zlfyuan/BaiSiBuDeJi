//
//  ZLFFriendTrendsViewController.m
//  百思不得姐
//
//  Created by zluof on 16/6/3.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFFriendTrendsViewController.h"
#import "ZLFRecommViewController.h"
@interface ZLFFriendTrendsViewController ()

@end

@implementation ZLFFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ThemeColor;

    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem iteminitWithImage:@"friendsRecommentIcon" heightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClicked)];
}

-(void)friendsClicked{
//    ZLFNSLog(@"%s",__func__);
    ZLFRecommViewController *ReVC = [[ZLFRecommViewController alloc]init];
    [self.navigationController pushViewController:ReVC animated:YES];
    
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
