//
//  BusInfoView.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-6.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BusInfoView.h"


@implementation BusInfoView

@synthesize lineNumber,startEnd,startTime,price,avgTime,feedback,share,back,lineNumberString,stationStartString,stationEndString,timeStartString,timeEndString;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        lineNumber = [[UILabel alloc] initWithFrame:CGRectMake(11, 7, 80, 60)];
        [self configureLineNumber:@"0"];
 
        startEnd = [[UILabel alloc] initWithFrame:CGRectMake(90,7, 230, 21)];
        [self configureStartEnd:@"0" end:@"0"];
 
        startTime = [[UILabel alloc] initWithFrame:CGRectMake(218, 32, 100, 21)];
        [self configureStartTime:@"0" endTime:@"0"];
  
        price = [[UILabel alloc] initWithFrame:CGRectMake(230, 56, 86, 21)];
        [self configurPrice];

        avgTime = [[UILabel alloc] initWithFrame:CGRectMake(140,85, 179, 21)];
        [self configureAvgTime];
    
        feedback = [[UIButton alloc] initWithFrame:CGRectMake(142,114, 73, 22)];
        [self configureFeedBack];
     
        share = [[UIButton alloc] initWithFrame:CGRectMake(236,114, 73, 22)];
        [self configureShare];

        back = [[UIButton alloc] initWithFrame:CGRectMake(11, 74, 55,44)];
        [self configureBack];
    }
    return self;
}

//- (NSDictionary *)hardData{
//    NSString * s1 = @"a";
//    NSString * s2 = @"b";
//    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:s1,@"1",s2,@"2", nil];
//    return dic;
//}

- (void)reloadData:(NSDictionary *)myDict
{
    lineNumberString = [[NSString alloc] init];
    lineNumberString = [[myDict objectForKey:@"busInfo"] objectForKey:@"rName"];
//    NSLog(@"lineNumberString: %@",[[myDict objectForKey:@"busInfo"] objectForKey:@"rName"]);
    stationStartString = [[NSString alloc] init];
    stationStartString = [[myDict objectForKey:@"busInfo"] objectForKey:@"rBegin"];
    stationEndString = [[NSString alloc] init];
    stationEndString = [[myDict objectForKey:@"busInfo"] objectForKey:@"rEnd"];
    timeStartString = [[NSString alloc] init];
    timeStartString = [[myDict objectForKey:@"busInfo"] objectForKey:@"rBegintime"];
    timeEndString = [[NSString alloc] init];
    timeEndString = [[myDict objectForKey:@"busInfo"] objectForKey:@"rEndtime"];

    
    [self configureLineNumber:lineNumberString];
    [self configureStartEnd:stationStartString end:stationEndString];
    [self configureStartTime:timeStartString endTime:timeEndString];
}

//配置 线路号
- (void)configureLineNumber:(NSString *)lineNumberS
{
    [lineNumber setBackgroundColor:[UIColor clearColor]];
    [lineNumber setText:lineNumberS];
    [lineNumber setTextAlignment:NSTextAlignmentCenter];
    [lineNumber setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [lineNumber setTextColor:[UIColor whiteColor]];
    [self addSubview:lineNumber];
}

//配置 起点终点
- (void)configureStartEnd:(NSString*)start end:(NSString *)end
{
    [startEnd setBackgroundColor:[UIColor clearColor]];
    NSString* startAndEnd = [[NSString alloc] initWithFormat:@"%@-%@",start,end];
    [startEnd setText:startAndEnd];
    [startEnd setTextColor:[UIColor whiteColor]];
    [startEnd setTextAlignment:NSTextAlignmentRight];

    [self addSubview:startEnd];
}

//配置 始发时间
- (void)configureStartTime:(NSString *)timeStart endTime:(NSString *)timeEnd
{
    [startTime setBackgroundColor:[UIColor clearColor]];
    NSString* timeStartAndEnd = [[NSString alloc] initWithFormat:@"%@-%@",timeStart,timeEnd];
    [startTime setText:timeStartAndEnd];
    [startTime setTextColor:[UIColor whiteColor]];
    [startTime setTextAlignment:NSTextAlignmentRight];

    [self addSubview:startTime];
}

//配置 价格
- (void)configurPrice
{
    [price setBackgroundColor:[UIColor clearColor]];
    [price setText:@"票价：1元"];
    [price setTextColor:[UIColor whiteColor]];
    [price setTextAlignment:NSTextAlignmentRight];
    [self addSubview:price];
}

//配置 平均等待时间
- (void)configureAvgTime
{
    [avgTime setBackgroundColor:[UIColor clearColor]];
    [avgTime setText:@"平均等待时间：10分钟"];
    [avgTime setTextColor:[UIColor whiteColor]];
    [avgTime setTextAlignment:NSTextAlignmentRight];
    [self addSubview:avgTime];
}

//配置 反馈
- (void)configureFeedBack
{
    [feedback setBackgroundColor:[UIColor clearColor]];
    [feedback setTitle:@"反馈" forState:UIControlStateNormal];
    [feedback.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [feedback setTitleColor:[UIColor colorWithRed:0.0f/255.0f green:108.0f/255.0f blue:171.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [self addSubview:feedback];
}

//配置 分享
- (void)configureShare
{
    [share setBackgroundColor:[UIColor clearColor]];
    [share setTitle:@"分享" forState:UIControlStateNormal];
    [share.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [share setTitleColor:[UIColor colorWithRed:0.0f/255.0f green:108.0f/255.0f blue:171.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [self addSubview:share];
}

//配置 返回按钮
- (void)configureBack
{
    [back setBackgroundImage:[UIImage imageNamed:@"jiantou.png"] forState:UIControlStateNormal];
    [self addSubview:back];
}

@end
