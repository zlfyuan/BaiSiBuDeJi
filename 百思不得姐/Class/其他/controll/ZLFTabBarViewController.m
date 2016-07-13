//
//  ZLFTabBarViewController.m
//  百思不得姐
//
//  Created by zluof on 16/6/3.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFTabBarViewController.h"
#import "ZLFEssenceViewController.h"
#import "ZLFFriendTrendsViewController.h"
#import "ZLFNewViewController.h"
#import "ZLFMeViewController.h"
#import "ZLFTabBar.h"
#import "ZLFNavigationControlle.h"
@interface ZLFTabBarViewController ()

@end

@implementation ZLFTabBarViewController

+(void)initialize{
    
    NSDictionary *attrDic1 =
    @{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSDictionary *attrDic2 =
    @{NSForegroundColorAttributeName:[UIColor darkGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:13]};
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrDic1 forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrDic2 forState:UIControlStateSelected];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addChildVC:[[ZLFEssenceViewController alloc]init] tarBarItemtitle:@"精华" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    
    [self addChildVC:[[ZLFNewViewController alloc]init] tarBarItemtitle:@"新帖" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    [self addChildVC:[[ZLFFriendTrendsViewController alloc]init] tarBarItemtitle:@"关注" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    
    [self addChildVC:[[ZLFMeViewController alloc]init] tarBarItemtitle:@"我的"image:@"tabBar_me_icon"selectImage:@"tabBar_me_click_icon"];
    
    [self setValue:[[ZLFTabBar alloc]init] forKey:@"tabBar"];
}


-(void)addChildVC:(UIViewController *)VC tarBarItemtitle:(NSString *)title image:(NSString*)image selectImage:(NSString *)selectimage{
    VC.tabBarItem.title = title;
    [VC.tabBarItem setImage:[UIImage imageNamed:image]];
    [VC.tabBarItem setSelectedImage:[UIImage imageNamed:selectimage]];
    ZLFNavigationControlle *nav = [[ZLFNavigationControlle alloc]initWithRootViewController:VC];
    [self addChildViewController:nav];
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
