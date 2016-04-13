//
//  DZSettingItemLabel.m
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "DZSettingItemLabel.h"

@implementation DZSettingItemLabel

-(void)setText:(NSString *)text
{
    _text = text;
    
    //归档
    [DZSettingTool setObject:text forKey:self.key];
}

-(void)setKey:(NSString *)key
{
    [super setKey:key];
    
    _text = [DZSettingTool objectForKey:self.key];
}

@end
