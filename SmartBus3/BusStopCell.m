//
//  BusStopCell.m
//  BusStopCellTest
//
//  Created by Tony Zhao on 13-8-11.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BusStopCell.h"

@implementation BusStopCell

@synthesize numberLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 70, 30)];

        timeLable = [[UILabel alloc] initWithFrame:CGRectMake(210, 0, 100, 20)];

        stationLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 220, 20)];
    }
    return self;
}

- (void)configureNumberLabel:(NSString *)number
{
    [numberLabel setText:number];
    [numberLabel setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:numberLabel];
}

- (void)configureTimeLabel:(NSString *)beginTime endTime:(NSString *)endtime
{
    NSString* text = [NSString stringWithFormat:@"%@-%@",beginTime,endtime];
    [timeLable setText:text];
    [timeLable setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:timeLable];
}

- (void)configureStationLabel:(NSString *)rBegin rEnd:(NSString *)rEnd
{
    NSString* text = [NSString stringWithFormat:@"%@-%@",rBegin,rEnd];
    [stationLabel setText:text];
    [stationLabel setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:stationLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
