//
//  DZSettingCell.h
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZSettingItem;
@interface DZSettingCell : UITableViewCell

@property (nonatomic, strong) DZSettingItem *item;

@property (nonatomic, strong) NSIndexPath *indexPath;

+(instancetype)settingCellWithTableView:(UITableView *)tableView;

@end
