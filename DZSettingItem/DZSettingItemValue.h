//
//  DZSettingItemValue.h
//  Lottery
//
//  Created by dengwei on 15/9/30.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//  需要存储数据的item都继承自它

#import "DZSettingItem.h"
#import "DZSettingTool.h"

@interface DZSettingItemValue : DZSettingItem

/**
 *  存储数据用的key
 */
@property (nonatomic, copy) NSString *key;

@end
