//
//  ArrowView.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-7.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArrowView : UIView

@property (nonatomic,retain) UIColor* arrowColor;

- (void)drawWithColor:(UIColor *)color;

@end
