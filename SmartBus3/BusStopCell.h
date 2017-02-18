//
//  BusStopCell.h
//  BusStopCellTest
//
//  Created by Tony Zhao on 13-8-11.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusStopCell : UITableViewCell
{
    UILabel* timeLable;
    UILabel* stationLabel;
}

@property (nonatomic,strong) UILabel* numberLabel;

- (void)configureNumberLabel:(NSString *)number;
- (void)configureTimeLabel:(NSString *)beginTime endTime:(NSString *)endtime;
- (void)configureStationLabel:(NSString *)rBegin rEnd:(NSString *)rEnd;

@end
