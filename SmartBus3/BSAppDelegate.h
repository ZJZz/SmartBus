//
//  BSAppDelegate.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-13.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface BSAppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;

@end
