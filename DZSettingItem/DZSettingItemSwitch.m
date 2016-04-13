//
//  DZSettingItemSwitch.m
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "DZSettingItemSwitch.h"

@implementation DZSettingItemSwitch

-(void)setOff:(BOOL)off
{
    _off = off;
    
    [DZSettingTool setBool:off forKey:self.key];
}

-(void)setKey:(NSString *)key
{
    [super setKey:key];
    
    _off = [DZSettingTool boolForKey:key];
}

@end
