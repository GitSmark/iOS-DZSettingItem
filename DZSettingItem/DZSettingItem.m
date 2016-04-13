//
//  DZSettingItem.m
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//  一个Item对应一个Cell
//  用来描述当前cell里面显示的内容,描述点击cell后做什么操作

#import "DZSettingItem.h"

@implementation DZSettingItem

+(instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title
{
    DZSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    
    return item;
}

+(instancetype)settingItemWithTitle:(NSString *)title
{
    return [self settingItemWithIcon:nil title:title];
}

@end
