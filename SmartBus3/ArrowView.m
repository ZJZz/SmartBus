//
//  ArrowView.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-7.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "ArrowView.h"

@implementation ArrowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.arrowColor = [UIColor grayColor];
    }
    return self;
}

- (void)drawWithColor:(UIColor *)color
{
    self.arrowColor = color;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *arrow = [UIBezierPath bezierPath];
    [self.arrowColor setFill];
    [arrow moveToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
    [arrow addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [arrow addLineToPoint:CGPointMake(0, 0)];
    [arrow addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
    [arrow fill];
}

@end
