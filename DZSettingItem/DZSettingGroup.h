//
//  DZSettingGroup.h
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZSettingGroup : NSObject

/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *header;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footer;

/**
 *  中间的条目
 */
@property (nonatomic, strong) NSArray *items;

@end
