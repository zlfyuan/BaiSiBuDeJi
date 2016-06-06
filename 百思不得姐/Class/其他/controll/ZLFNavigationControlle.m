//
//  ZLFNavigationControlle.m
//  百思不得姐
//
//  Created by zluof on 16/6/6.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFNavigationControlle.h"

@interface ZLFNavigationControlle ()

@end

@implementation ZLFNavigationControlle

+(void)initialize{
    //指定设置 ZLFNavigationControlle控制器
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
        [back setTitle:@"返回" forState:UIControlStateNormal];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [back setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        back.sizeV = CGSizeMake(50, 30);
        back.backgroundColor = [UIColor blueColor];
        back.contentHorizontalAlignment =  UIControlContentHorizontalAlignmentLeft;
        back.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
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
