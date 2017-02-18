//
//  BSMainViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-13.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray* allItems;
    BOOL showAnimate;

}
@end
