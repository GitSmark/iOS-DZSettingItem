//
//  DZSettingItem.h
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZSettingItem : NSObject

/**
 *  cell图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  cell标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  cell子标题
 */
@property (nonatomic, copy) NSString *subtitle;

/**
 *  点击cell后需要执行的操作
 */
@property (nonatomic, copy) void (^operation)();

+(instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title;

+(instancetype)settingItemWithTitle:(NSString *)title;

@end
