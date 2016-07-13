//
//  ZLFEssenceViewController.m
//  百思不得姐
//
//  Created by zluof on 16/6/3.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFEssenceViewController.h"
#import "ZLFRecommendController.h"
@interface ZLFEssenceViewController ()
/**横线指示器*/
@property (nonatomic, strong)UIView *indorView;
/** 记录当前按钮*/
@property (nonatomic, strong)UIButton *selectButton;
@end

@implementation ZLFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNamv];
    [self setupSegment];
}
/**
 * 添加分段控件
 */
-(void)setupSegment{
    UIView *segView = [[UIView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.heightV+self.navigationController.navigationBar.yV, self.view.widthV, 35)];
    segView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:segView];
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor redColor];
    lineView.heightV = 2;
    lineView.yV = segView.heightV - lineView.heightV;
    [segView addSubview:lineView];
    self.indorView = lineView;
    
    
    NSArray *titles = @[@"全部全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat height = segView.heightV;
    CGFloat width = segView.widthV/titles.count;
    for (int i= 0 ; i<titles.count; i++) {
        UIButton *but = [[UIButton alloc]init];
        but.widthV = width;
        but.heightV = height;
        but.xV = i*but.widthV;
        but.yV = 0;
        [but setTitle:titles[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [but addTarget:self action:@selector(titleButclicked:) forControlEvents:UIControlEventTouchUpInside];
        [segView addSubview:but];
        
        if(i ==0){
            but.enabled = NO;
            [but.titleLabel sizeToFit];
            self.indorView.widthV = but.titleLabel.widthV;
            self.indorView.centerX = but.centerX;
            self.selectButton = but;
        }

    
    }
   
}
-(void)titleButclicked:(UIButton *)but{
    //当前按钮点击为yes
    self.selectButton.enabled = YES;
    //点击的按钮为不被点击
    but.enabled = NO;
    //记录当前按钮
    self.selectButton = but;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.indorView.widthV = [but.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}].width;
        self.indorView.centerX = but.centerX;
    
    }];
}
/**
 * 设置导航栏
 */
-(void)setupNamv{
    self.view.backgroundColor = ThemeColor;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem iteminitWithImage:@"MainTagSubIcon" heightImage:@"MainTagSubIconClick" target:self action:@selector(tagButtonClicked)];
}
-(void)tagButtonClicked{

    ZLFRecommendController *recommedVC = [[ZLFRecommendController alloc]init];
    [self.navigationController pushViewController:recommedVC animated:YES];
}

@end

