//
//  MyCell.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-6.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
{
    bool haveBus;
}

@property (nonatomic,strong) UIButton* numberButton;
@property (nonatomic,strong) UIImageView* roadView;
@property (nonatomic,strong) UILabel* stationNameLable;
@property (nonatomic,strong) UISwitch* arriveAlertSwitch;

- (void)configureNumberButton:(NSString*)number;
- (void)configureRoadView:(int)state;
- (void)configureSatationNameLable:(NSString*)name;
- (void)configureArriveAlertSwitch;
- (void)addBus:(int)state;

@end
