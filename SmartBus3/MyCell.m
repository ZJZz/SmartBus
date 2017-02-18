//
//  MyCell.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-6.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "MyCell.h"


@implementation MyCell
@synthesize numberButton,roadView,stationNameLable,arriveAlertSwitch;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        haveBus = false;
        
        numberButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 30, 40)];

        roadView = [[UIImageView alloc] initWithFrame:CGRectMake(55, 0, 60, 80)];
  
        stationNameLable = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 80, 40)];
        
        arriveAlertSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(280, 0, 30, 20)];
    }
    return self;
}

- (void)configureNumberButton:(NSString*)number
{
    numberButton.backgroundColor = [UIColor clearColor];
    [numberButton setTitle:number forState:UIControlStateNormal];
    [numberButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:numberButton];
}

- (void)configureRoadView:(int)state
{
    if (state == 0)
        [roadView setImage:[UIImage imageNamed:@"route_road_green.png"]];
    else if (state == 1)
        [roadView setImage:[UIImage imageNamed:@"route_road_yellow.png"]];
    else if (state == 2)
        [roadView setImage:[UIImage imageNamed:@"route_road_red.png"]];
    [self.contentView addSubview:roadView];
    

}

- (void)configureSatationNameLable:(NSString*)name
{
    stationNameLable.backgroundColor = [UIColor clearColor];
    stationNameLable.text = name;
    [stationNameLable setTextColor:[UIColor blackColor]];
    [stationNameLable setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:stationNameLable];
}

- (void)configureArriveAlertSwitch
{
    arriveAlertSwitch.on = NO;
    self.accessoryView = arriveAlertSwitch;
}

- (void)addBus:(int)state
{
    if (haveBus == false)
    {
    
    UIImageView* busOnRoadView = [[UIImageView alloc] initWithFrame:CGRectMake(15.5, 50, 29, 16)];
    
    if (state == 0)
        [busOnRoadView setImage:[UIImage imageNamed:@"route_bus_green.png"]];
    else if (state == 1)
        [busOnRoadView setImage:[UIImage imageNamed:@"route_bus_yellow.png"]];
    else if (state == 2)
        [busOnRoadView setImage:[UIImage imageNamed:@"route_bus_red.png"]];
    
    [roadView addSubview:busOnRoadView];
    [self.contentView addSubview:roadView];
        
        haveBus = true;
    }
}

@end
