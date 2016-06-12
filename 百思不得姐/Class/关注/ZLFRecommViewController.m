//
//  ZLFRecommViewController.m
//  百思不得姐
//
//  Created by zluof on 16/6/6.
//  Copyright © 2016年 zluof. All rights reserved.
//

#define SelectRow self.categoryData [self.categroytableview.indexPathForSelectedRow.row]

#import "ZLFRecommViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import "ZLFCategroyTableViewCell.h"
#import "ZLFcateegoryMode.h"
#import "ZLFRecommUserTableViewCell.h"
#import "ZLFRecommUsermode.h"
@interface ZLFRecommViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *categroytableview;

@property (weak, nonatomic) IBOutlet UITableView *usersTableview;
/**左边表的数据 */
@property (nonatomic, strong)NSArray *categoryData;
/** 请求参数*/
@property (nonatomic, strong)NSMutableDictionary *parem;
/** AFNET*/
@property (nonatomic, strong)AFHTTPSessionManager *manger;
@end

static NSString *const categorycellId = @"category";
static NSString *const usercellId = @"user";
@implementation ZLFRecommViewController
-(AFHTTPSessionManager *)manger{
    if (_manger==nil) {
        _manger = [AFHTTPSessionManager manager];
    }
    return _manger;
}
-(void)request
{
    //显示指示器
    [SVProgressHUD showWithStatus:@"死命加载啦..."];
    //发送请求
    NSMutableDictionary *paramete =[NSMutableDictionary dictionary];
    paramete[@"a"] = @"category";
    paramete[@"c"] = @"subscribe";
    
    [self.manger GET:@"http://api.budejie.com/api/api_open.php" parameters:paramete progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        ZLFNSLog(@"%@",responseObject);
        //字典数组变模型数组
        self.categoryData = [ZLFcateegoryMode mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新categroytableview
        [self.categroytableview reloadData];
        
        //默认选中第一个
        [self.categroytableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //隐藏指示器
        [SVProgressHUD dismiss];
        //进入刷新状态
        [self.usersTableview.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //加载错误时
        [SVProgressHUD showErrorWithStatus:@"亲~~~！是不是没网络啊"];
    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setuptableview];
    
    [self setupRefrsh];
    
    [self request];
   
}

/**
 * tableview 控件
 */
-(void)setuptableview{
    self.title = @"推荐关注";
    self.view.backgroundColor = ThemeColor;
    self.categroytableview.backgroundColor = ThemeColor;
    self.usersTableview.backgroundColor = ThemeColor;
    //注册
    [self.categroytableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZLFCategroyTableViewCell class]) bundle:nil] forCellReuseIdentifier:categorycellId];
    [self.usersTableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZLFRecommUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:usercellId];
    //行高
    self.usersTableview.rowHeight = 70;
    //取消自动设置偏移量
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categroytableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.usersTableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    
}
/**
 * 刷新控件
 */
-(void)setupRefrsh{
    
    self.usersTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.usersTableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.usersTableview.mj_footer.hidden = YES;
}

/**
 * 检查foot的状态
 */
-(void)checkFootStatus{
    ZLFcateegoryMode *categroy = SelectRow;
    self.usersTableview.mj_footer.hidden = (categroy.users.count==0);
    if (categroy.total == categroy.users.count) {
        //全部数据已加载完了
        [self.usersTableview.mj_footer endRefreshingWithNoMoreData];
    }else{
        //结束刷新
        [self.usersTableview.mj_footer endRefreshing];
    }

}
#pragma mark---刷新方法
-(void)loadMoreData{
    //刷新数据
    ZLFcateegoryMode *categroy = SelectRow;
    
    NSMutableDictionary *paramete =[NSMutableDictionary dictionary];
    paramete[@"a"] = @"list";
    paramete[@"c"] = @"subscribe";
    paramete[@"category_id"] = @(categroy.id);
    paramete[@"page"] = @(++categroy.current_page);
    self.parem = paramete;//(保存请求参数)
    [self.manger GET:@"http://api.budejie.com/api/api_open.php" parameters:paramete progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        NSArray *use = [ZLFRecommUsermode mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [categroy.users addObjectsFromArray:use];
        
        //self.parem用户最后一次请求的数据 （防止发送多个请求）
        if (self.parem != paramete) return ;
        
        [self.usersTableview reloadData];
        
        categroy.total = [responseObject[@"total"] integerValue];
        
        [self checkFootStatus];
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parem != paramete) return ;
        //加载失败时
        [SVProgressHUD showErrorWithStatus:@"加载失败啦"];
    }];

}

-(void)loadNewData{
    
    ZLFcateegoryMode *categroy = SelectRow;
    categroy.current_page = 1;//初始值为1
    //发送网络请求
    //请求参数
    NSMutableDictionary *paramete =[NSMutableDictionary dictionary];
    paramete[@"a"] = @"list";
    paramete[@"c"] = @"subscribe";
    paramete[@"category_id"] = @(categroy.id);
    paramete[@"page"] = @(categroy.current_page);
    self.parem = paramete;
//    [manager get];
    [self.manger GET:@"http://api.budejie.com/api/api_open.php" parameters:paramete progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        //得到网络数据
        NSArray *use = [ZLFRecommUsermode mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //清除所有旧数据（得到最新数据）
        [categroy.users removeAllObjects];
        //把当前类别的用户数据给模型
        [categroy.users addObjectsFromArray:use];
        
        //self.parem用户最后一次请求的数据 （防止发送多个请求）
        if (self.parem != paramete) return ;
        
        //             ZLFNSLog(@"%@",responseObject);
        //刷新用户表格
        [self.usersTableview reloadData];
        //保存总数量
        categroy.total = [responseObject[@"total"] integerValue];
        //检查foot状态
        [self checkFootStatus];
        //结束刷新
        [self.usersTableview.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.parem != paramete) return ;
        //加载失败时
        [SVProgressHUD showErrorWithStatus:@"加载失败啦"];
  }];


}
#pragma mark tacbleviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.categroytableview) {
        return self.categoryData.count;
    }else{
        
//    获取当前的选中的cell   [self.categroytableview.indexPathForSelectedRow.row]
        return [[SelectRow users] count];
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categroytableview) {
        
        ZLFCategroyTableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:categorycellId];
        cell.categroyMode = self.categoryData[indexPath.row];
        
        return cell;
    }else{
        
        ZLFRecommUserTableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:usercellId];
        cell.modeuser =[SelectRow users][indexPath.row];
        
        return cell;
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消刷新
    [self.usersTableview.mj_header endRefreshing];
    [self.usersTableview.mj_footer endRefreshing];
    
    ZLFcateegoryMode *categroy = self.categoryData[indexPath.row];
    
    if (categroy.users.count) {
       //显示曾经的数据(避免重复发送请求 )
        [self.usersTableview reloadData];
        
    }else{
        //解决网络卡的时候（直接刷新避免让用户看到上一次的数据）
        [self.usersTableview reloadData];
        //开始刷新
        [self.usersTableview.mj_header beginRefreshing];
        
    }
    
}

-(void)dealloc{
    //停止操作
    [self.manger.operationQueue cancelAllOperations];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [SVProgressHUD dismiss];
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
