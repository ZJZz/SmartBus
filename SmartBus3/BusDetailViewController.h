//
//  BusDetailViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-22.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StationInfo;
@class BusInfoView;

@interface BusDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate>
{
    NSArray* station;
    NSInteger rowNumber;
    BOOL pressed;
    NSMutableArray* alertFlagArray;//存储UISwitch.On Array
    BusInfoView* busInfoView;
    NSDictionary* netDict;
    UITableView* tableview;
    StationInfo* stationInfo;
}

@property (nonatomic,strong) UIView* busMessage;//公交信息视图

@property (nonatomic,copy) NSString* lineNumber;//为BusInfoView传参
@property (nonatomic,retain) NSMutableData* netData;//存网络数据


@end
