//
//  StationInfo.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-5.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationInfo : NSObject

@property (nonatomic,strong) NSArray* linesArray;
@property (nonatomic,copy) NSString*  number;//站点号
@property (nonatomic) int  congestionState;
@property (nonatomic,copy) NSString* stationName;//站点名字
@property (nonatomic) BOOL arriveAlert;//到站提醒Switch状态


- (NSMutableArray *)stationInfos;

@end
