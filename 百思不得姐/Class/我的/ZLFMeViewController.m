//
//  ZLFMeViewController.m
//  百思不得姐
//
//  Created by zluof on 16/6/3.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFMeViewController.h"

@interface ZLFMeViewController ()

@end

@implementation ZLFMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ThemeColor;

    self.navigationItem.title = @"我的";
    
     UIBarButtonItem *set = [UIBarButtonItem iteminitWithImage:@"mine-setting-icon" heightImage:@"mine-setting-icon-click" target:self action:@selector(friendsClicked)];
     UIBarButtonItem *moom = [UIBarButtonItem iteminitWithImage:@"mine-moon-icon" heightImage:@"mine-moon-icon-click" target:self action:@selector(moomClicked)];
        self.navigationItem.rightBarButtonItems = @[set,moom];
}

-(void)friendsClicked{
    ZLFNSLog(@"%s",__func__);
}

-(void)moomClicked{
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
