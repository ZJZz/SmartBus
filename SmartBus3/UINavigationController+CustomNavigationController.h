//
//  UINavigationController+CustomNavigationController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-15.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UINavigationController (CustomNavigationController)

- (void)customNavigationBar;
- (UIButton*)backButtonWith:(UIImage*)backButtonImage;
- (UILabel*)titleLable:(NSString*)functionName;
- (void)back;

@end
