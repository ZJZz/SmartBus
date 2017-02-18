//
//  UINavigationController+CustomNavigationController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-15.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "UINavigationController+CustomNavigationController.h"

@implementation UINavigationController (CustomNavigationController)



- (void)customNavigationBar {
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bar3"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [self.navigationBar drawRect:self.navigationBar.bounds];
    }
}

- (void)drawRect:(CGRect)rect {
    [[UIImage imageNamed:@"bar3"] drawInRect:rect];
}

- (UIButton*)backButtonWith:(UIImage*)backButtonImage
{
    UIImage* arrow = backButtonImage;
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, arrow.size.width, arrow.size.height);
    [backButton setBackgroundImage:arrow forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    return backButton;
}

-(UILabel*)titleLable:(NSString*)functionName
{
    UILabel* titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    [titleLable setText:functionName];
    [titleLable setFont:[UIFont fontWithName:@"Helvetica" size:25]];
    [titleLable setTextColor:[UIColor whiteColor]];
    [titleLable setBackgroundColor:[UIColor clearColor]];
    [titleLable setTextAlignment:NSTextAlignmentLeft];
    return titleLable;
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

@end
