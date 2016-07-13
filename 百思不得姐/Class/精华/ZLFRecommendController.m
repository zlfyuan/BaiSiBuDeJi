//
//  ZLFRecommendController.m
//  百思不得姐
//
//  Created by zluof on 16/6/12.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ZLFRecommendController.h"
#import "ZLFRecommdTagCell.h"
#import "ZLFTagsMode.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
@interface ZLFRecommendController ()
/** 标签数据*/
@property (nonatomic, strong)NSArray *tagsList;
@end
static NSString *const tagCellId = @"tagCell";
@implementation ZLFRecommendController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupTableview];
    [self request];
}

-(void)request{
    
    NSMutableDictionary *paramete =[NSMutableDictionary dictionary];
    paramete[@"a"] = @"tag_recommend";
    paramete[@"action"] = @"sub";
    paramete[@"c"] = @"topic";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:paramete progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.tagsList = [ZLFTagsMode mj_objectArrayWithKeyValuesArray:responseObject];
        NSLog(@"%@",self.tagsList);
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
-(void)setupTableview{
    
    self.title = @"推荐订阅";
    self.view.backgroundColor = ThemeColor;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZLFRecommdTagCell class]) bundle:nil] forCellReuseIdentifier:tagCellId];
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLFRecommdTagCell *cell = [tableView dequeueReusableCellWithIdentifier:tagCellId forIndexPath:indexPath];
    cell.tagsRecommend = self.tagsList[indexPath.row];
    // Configure the cell...
    
    return cell;
}



@end
