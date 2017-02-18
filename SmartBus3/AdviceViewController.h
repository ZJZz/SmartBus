//
//  AdviceViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-8.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapseClick.h"


@interface AdviceViewController : UIViewController <CollapseClickDelegate,NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>
{
//    UITableView* testView;
//    UITableView* test2View;
    CollapseClick* myCollapseClick;
    BOOL netFinish;
    NSMutableArray* contentTableViewArray;
}

@property (nonatomic,copy) NSString* function;

@property (nonatomic,copy) NSString* startString;
@property (nonatomic,copy) NSString* endString;

@property (nonatomic) NSMutableData* netData;
@property (nonatomic) NSArray* netArray;

@end
