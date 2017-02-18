//
//  BSRealTimeController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-20.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BSRealTimeController.h"
#import "BusDetailViewController.h"
#import "BusOnMapViewController.h"


@interface BSRealTimeController ()

@end

@implementation BSRealTimeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
	
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    BusDetailViewController* busDetailViewController = [[BusDetailViewController alloc] init];
    BusOnMapViewController* busOnMapViewController = [[BusOnMapViewController alloc] init];
    
    NSArray* controllers = [NSArray arrayWithObjects:busDetailViewController,busOnMapViewController, nil];
    tabBarController.viewControllers = controllers;
    
    [self.view addSubview:tabBarController.view];
    
//    BusDetailView* busdetail = [[BusDetailView alloc] initWithFrame:CGRectMake(0, 0, 320, 161)];
//    [self.view addSubview:busdetail];
    
//    RealTimeTableViewController* realTimeTableController = [[RealTimeTableViewController alloc] init];
//    BusOnMapViewController* busOnMapController = [[BusOnMapViewController alloc] init];

//   NSArray* viewControllers = [NSArray arrayWithObjects:table,map, nil];
    
//    UITabBar* tabbar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 411, 320, 49)];
//    UITabBarController* tabBarController = [[UITabBarController alloc] init];
//    [tabBarController.view setFrame:CGRectMake(0, 411, 320, 49)];
//    [tabBarController setViewControllers:viewControllers];
//    [self.view addSubview:tabBarController.view];
//    
//    [self addChildViewController:tabBarController];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
