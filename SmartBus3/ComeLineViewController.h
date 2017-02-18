//
//  ComeLineViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-8.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComeLineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
{
    UITableView* tableView;
    NSMutableData* netData;
    NSArray* netArray;
}

@property (nonatomic,copy) NSString* function;
@property (nonatomic,copy) NSString* searchBusStop;

@end
