//
//  DZBaseSettingViewController.h
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZSettingCell.h"
#import "DZSettingItem.h"
#import "DZSettingGroup.h"
#import "DZSettingItemArrow.h"
#import "DZSettingItemSwitch.h"
#import "DZSettingItemLabel.h"
#import "DZSettingKeys.h"

@interface DZBaseSettingViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    /**
     *  所有的组模型
     */
    NSMutableArray *_allGroups;
}

@property (nonatomic, weak, readonly) UITableView *tableView;

@end
