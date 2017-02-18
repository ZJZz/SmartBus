//
//  StationInfo.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-5.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "StationInfo.h"

@implementation StationInfo

@synthesize stationName,arriveAlert,congestionState,number,linesArray;

- (NSMutableArray *)stationInfos
{
    NSMutableArray* stationInfoArray = [[NSMutableArray alloc] init];
    
    int count = [linesArray count];
    
    for (int i = 0; i < count; i++) 
        [self create:stationInfoArray row:i];
    
    return stationInfoArray;
}

- (void)create:(NSMutableArray *)array row:(NSInteger)row
{
    StationInfo* s = [[StationInfo alloc] init];
    s.stationName = [[linesArray objectAtIndex:row] objectForKey:@"stop_name"];
    s.congestionState = [[[linesArray objectAtIndex:row] objectForKey:@"status"] intValue];
    
    NSString* numberString = [NSString stringWithFormat:@"%@",[[linesArray objectAtIndex:row] objectForKey:@"position"]];
    s.number = numberString;
    NSLog(@"%@",s);
    [array addObject:s];
}




//- (void)configureNumber:(NSString *)rowNumber
//{
//    number.backgroundColor = [UIColor clearColor];
//    [number setTitle:rowNumber forState:UIControlStateNormal];
//    [number setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//}
//
//- (void)configureRoad
//{
//    road.image = [UIImage imageNamed:@"road.png"];
//}
//
//- (void)configureStationName:(NSInteger)index
//{
//    stationName.backgroundColor = [UIColor clearColor];
//    stationName.text = [station objectAtIndex:index];
//    [stationName setTextColor:[UIColor blackColor]];
//    [stationName setTextAlignment:NSTextAlignmentLeft];
//}

@end
