//
//  RealTimeTabViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-22.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "RealTimeTabViewController.h"
#import "BusDetailViewController.h"
#import "BusOnMapViewController.h"
#import "UINavigationController+CustomNavigationController.h"


@interface RealTimeTabViewController ()

@end

@implementation RealTimeTabViewController

@synthesize searchLineNumber;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    //设置NavigationController
    [self.navigationController customNavigationBar];
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationItem setHidesBackButton:YES];
    
    
    //设置UITabBarController
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    
    BusDetailViewController* busDetailViewController = [[BusDetailViewController alloc] init];
    busDetailViewController.lineNumber = searchLineNumber;
    busDetailViewController.tabBarItem.title = @"路况";
    UIImage* i = [UIImage imageNamed:@"road.png"];
    busDetailViewController.tabBarItem.image = i;
    
    BusOnMapViewController* busOnMapViewController = [[BusOnMapViewController alloc] init];
    busOnMapViewController.lineNumber = searchLineNumber;
    busOnMapViewController.tabBarItem.title = @"地图";
    UIImage* j = [UIImage imageNamed:@"map_icon.png"];
    busOnMapViewController.tabBarItem.image = j;

    NSArray* controllers = [NSArray arrayWithObjects:busDetailViewController,busOnMapViewController, nil];
    
    [tabBarController setViewControllers:controllers];
    [self.view addSubview:tabBarController.view];
    [self addChildViewController:tabBarController];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
