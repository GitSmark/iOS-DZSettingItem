//
//  DZSettingDemoViewController.m
//  Add
//
//  Created by huangxy on 16/4/12.
//  Copyright © 2016年 huangxy. All rights reserved.
//

#import "DZSettingDemoViewController.h"

@implementation DZSettingDemoViewController
{
    DZSettingItemLabel *_label1;
    DZSettingItemLabel *_label2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
    [self add1SectionItems];
}

- (void)add0SectionItems {
    DZSettingItemArrow *arrow1 = [DZSettingItemArrow settingItemWithIcon:@"Image" title:@"ItemArrow1"];
    //arrow1.showViewControllerClass = [DZViewController class];
    //    //copy状态下的block(堆里面的block),会对里面所使用的外界变量产生强引用
    //    __weak DZSettingDemoViewController *setting = self;
    //    push.operation = ^{
    //        DZViewController *pushVc = [[DZViewController alloc] init];
    //        [setting.navigationController pushViewController:pushVc animated:YES];
    //    };
    DZSettingItemArrow *arrow2 = [DZSettingItemArrow settingItemWithTitle:@"ItemArrow2"];
    //arrow2.showViewControllerClass = [DZViewController class];
    
    DZSettingItemLabel *label1 = [DZSettingItemLabel settingItemWithIcon:@"Image" title:@"ItemLabel1"];
    label1.key = DZKEY;
    label1.text = @"text1";
    //__weak
    //__unsafe_unretained DZSettingDemoViewController *liveVc = self;
    _label1 = label1;
    label1.operation = ^{
        _label1.text = @"11111";
        [self.tableView reloadData];
    };
    
    DZSettingItemLabel *label2 = [DZSettingItemLabel settingItemWithTitle:@"ItemLabel2"];
    label2.key = DZKEY1;
    label2.text = @"text2";
    _label2 = label2;
    label2.operation = ^{
        _label2.text = @"22222";
        [self.tableView reloadData];
    };
    
    DZSettingGroup *group = [[DZSettingGroup alloc] init];
    group.items = @[arrow1, arrow2, label1, label2];
    [_allGroups addObject:group];

}

- (void)add1SectionItems {
    DZSettingItemSwitch *switch1 = [DZSettingItemSwitch settingItemWithIcon:@"Image" title:@"ItemSwitch1"];
    switch1.key = DZKEY2;
    DZSettingItemSwitch *switch2 = [DZSettingItemSwitch settingItemWithTitle:@"ItemSwitch2"];
    switch2.key = DZKEY3;
    switch2.off = NO;
    
    DZSettingGroup *group = [[DZSettingGroup alloc] init];
    group.header = @"This is header text.";
    group.footer = @"This is footer text.";
    group.items = @[switch1, switch2];
    [_allGroups addObject:group];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
