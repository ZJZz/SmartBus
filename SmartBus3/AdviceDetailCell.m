//
//  AdviceDetailCell.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-9.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "AdviceDetailCell.h"

@implementation AdviceDetailCell
@synthesize wayImage,textLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        wayImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 8.5, 38, 27)];
//        [wayImage setImage:[UIImage imageNamed:@"road_icon_begin.png"]];
//        [self.contentView addSubview:wayImage];
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 8.5, 220, 27)];
//        [textLabel setText:@"乘901,坐到黑石礁下车"];
//        [self.contentView addSubview:textLabel];
    }
    return self;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWayImage:(NSInteger)row 
{
    if (row == 0)
    {
        [wayImage setImage:[UIImage imageNamed:@"road_icon_begin.png"]];
    }
    else if (row == 1)
    {
        [wayImage setImage:[UIImage imageNamed:@"road_icon_bus.png"]];
    }
    else if ( row == 2)
    {
       [wayImage setImage:[UIImage imageNamed:@"road_icon_man.png"]];
    }
    else if ( row == 3 )
    {
        [wayImage setImage:[UIImage imageNamed:@"road_icon_end.png"]];
    }
    [self.contentView addSubview:wayImage];
}

- (void)configureTextLabel:(NSInteger)row
{
    if (row == 0) {
        [textLabel setText:@"东软信息学院"];
    }
    if (row == 1)
    {
        [textLabel setText:@"乘坐901在星海公园下车"];
    }
    if (row == 2)
    {
        [textLabel setText:@"步行至星海公园"];
    }
    if (row == 3)
    {
        [textLabel setText:@"星海公园"];
    }
    [self.contentView addSubview:textLabel];
}

@end
