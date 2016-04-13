//
//  DZSettingCell.m
//  Lottery
//
//  Created by dengwei on 15/9/28.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "DZSettingCell.h"
#import "DZSettingItem.h"
#import "DZSettingItemArrow.h"
#import "DZSettingItemSwitch.h"
#import "DZSettingItemLabel.h"

@interface DZSettingCell ()
{
    UIImageView *_arrow;
    UISwitch *_switch;
    UILabel *_label;
    UIView *_divider;
}

@end

@implementation DZSettingCell

+(instancetype)settingCellWithTableView:(UITableView *)tableView
{
    static NSString *cellIdentifier = @"cell";
    //forIndexPath:indexPath 跟 storyboard 配套使用
    DZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //Configure the cell ...
    if (cell == nil) {
        cell = [[DZSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加分割线
        [self setupDivider];
    }
    return self;
}

#pragma mark 添加分割线
-(void)setupDivider
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:0.3];
    [self.contentView addSubview:divider];
    _divider = divider;
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    _divider.hidden = indexPath.row == 0;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _divider.frame = CGRectMake(self.textLabel.frame.origin.x, 0, self.contentView.frame.size.width + 50, 0.8);
}

-(void)setItem:(DZSettingItem *)item
{
    _item = item;
    
    //设置数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    if ([item isKindOfClass:[DZSettingItemArrow class]]) {
        [self settingArrow];
        
    }else if([item isKindOfClass:[DZSettingItemSwitch class]]){
        [self settingSwitch];
    }else if([item isKindOfClass:[DZSettingItemLabel class]]){
        [self settingLabel];
    }else{
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault; //用默认的选中样式
    }
}



#pragma mark - 设置右边文本标签
-(void)settingLabel
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.bounds = CGRectMake(0, 0, 100, self.frame.size.height);
        _label.textAlignment = NSTextAlignmentRight;
        _label.backgroundColor = [UIColor clearColor];
    }
    self.accessoryView = _label;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    DZSettingItemLabel *label = (DZSettingItemLabel *)_item;
    _label.text = label.text;
}

#pragma mark - 设置右边开关
-(void)settingSwitch
{
    if (_switch == nil) {
        _switch = [[UISwitch alloc] init];
        [_switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    //设置开关状态
    DZSettingItemSwitch *switchItem = (DZSettingItemSwitch *)_item;
    _switch.on = !switchItem.off;
    
    self.accessoryView = _switch;
    self.selectionStyle = UITableViewCellSelectionStyleNone; //禁止选中
}

#pragma mark 开关状态改变
-(void)switchChange
{
    DZSettingItemSwitch *switchItem = (DZSettingItemSwitch *)_item;
    switchItem.off = !_switch.on;
}

#pragma mark - 设置右边箭头
-(void)settingArrow
{
    if (_arrow == nil) {
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];;
    }
    self.accessoryView = _arrow;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
