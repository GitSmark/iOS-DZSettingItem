//
//  DZBaseSettingViewController.m
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "DZBaseSettingViewController.h"

const int DZCellSectionHeaderH = 20;

@interface DZBaseSettingViewController ()


@end

@implementation DZBaseSettingViewController

-(void)loadView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    // group状态下，sectionFooterHeight和sectionHeaderHeight是有值的
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = DZCellSectionHeaderH;
    
    // 在tableView初始化的时候设置contentInset
    // 在tableView展示完数据的时候给contentInset.top增加64的值
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        tableView.contentInset = UIEdgeInsetsMake(DZCellSectionHeaderH - 35, 0, 0, 0);
    }
    
    // 隐藏分隔线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.view = tableView;
    
    _tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _allGroups = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return _allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    DZSettingGroup *group = _allGroups[section];
    return group.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个cell
    DZSettingCell *cell = [DZSettingCell settingCellWithTableView:tableView];
    
    //取出这行对应的模型
    DZSettingGroup *group = _allGroups[indexPath.section];
    cell.item = group.items[indexPath.row];
    cell.indexPath = indexPath;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //0.取出这行对应模型
    DZSettingGroup *group = _allGroups[indexPath.section];
    DZSettingItem *item = group.items[indexPath.row];
    //1.取出这行对应模型中的block代码
    if (item.operation) {
        //执行block
        item.operation();
    }
    //2.检测有没有需要跳转的控制器
    if ([item isKindOfClass:[DZSettingItemArrow class]]) {
        DZSettingItemArrow *arrowItem = (DZSettingItemArrow *)item;
        if (arrowItem.showViewControllerClass) {
            UIViewController *vc = [[arrowItem.showViewControllerClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
}

#pragma mark 返回每组的header标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DZSettingGroup *group = _allGroups[section];
    return group.header;
}

#pragma mark 返回每组的footer标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DZSettingGroup *group = _allGroups[section];
    return group.footer;
}


@end
