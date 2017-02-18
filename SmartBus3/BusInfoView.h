//
//  BusInfoView.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-6.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusInfoView : UIView

@property (nonatomic,strong) UILabel* lineNumber;//线路号
@property (nonatomic,strong) UILabel* startEnd;//起点终点站名
@property (nonatomic,strong) UILabel* startTime;//始发时间
@property (nonatomic,strong) UILabel* price;//价格
@property (nonatomic,strong) UILabel* avgTime;//平均等待时间
@property (nonatomic,strong) UIButton* feedback;//反馈
@property (nonatomic,strong) UIButton* share;//分享
@property (nonatomic,strong) UIButton* back;//返回按钮

@property (nonatomic,copy) NSString* lineNumberString;
@property (nonatomic,copy) NSString* stationStartString;
@property (nonatomic,copy) NSString* stationEndString;
@property (nonatomic,copy) NSString* timeStartString;
@property (nonatomic,copy) NSString* timeEndString;





- (void)reloadData:(NSDictionary *)myDict;

@end
