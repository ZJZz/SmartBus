//
//  BSSearchLineViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-5.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RealTimeTabViewController;

@interface BSSearchLineViewController : UIViewController<UITextFieldDelegate>
{
    NSString* function;
    NSString* linenumber;
    RealTimeTabViewController* realTimeTableViewController;
}

@property (nonatomic,strong) NSString* function;

@end

