//
//  BSMainViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-13.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BSMainViewController.h"
#import "BSSearchBustopViewController.h"
#import "BSRealTimeController.h"
#import "RealTimeTabViewController.h"
#import "BSSearchLineViewController.h"
#import "AdviceViewController.h"
#import "StartEndViewController.h"


@interface BSMainViewController ()

@end

@implementation BSMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    showAnimate = YES;

    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    allItems =[[NSArray alloc] initWithObjects:@"站点查询",@"线路查询",@"线路推荐",@"公交车定位",@"实时线路推荐",@"实时出行方案",@"用户反馈",@"投诉", nil];
    
    UIImageView* background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    background.image = [UIImage imageNamed:@"busstop"];
    [self.view addSubview:background];
    [self addLables];
    
    UITableView* functionTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 185, 230, 270) style:UITableViewStylePlain];
    [functionTable setIndicatorStyle:UIScrollViewIndicatorStyleBlack];
    [functionTable setBackgroundColor:[UIColor clearColor]];
    [functionTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [functionTable setDelegate:self];
    [functionTable setDataSource:self];
    [functionTable setScrollsToTop:YES];
    
    [self.view addSubview:functionTable];
}

-(void)viewWillAppear:(BOOL)animated
{
     [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//Protocol --  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    // Configure the cell...
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [[cell textLabel] setText:[allItems objectAtIndex:[indexPath row]]];
    [[cell textLabel] setTextAlignment:NSTextAlignmentRight];
    [[cell textLabel] setTextColor:[UIColor whiteColor]];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:21]];
    
    if(showAnimate)
    {
        [cell setCenter:CGPointMake(-cell.frame.size.width, cell.frame.size.height * [indexPath row] )];
        [UIView animateWithDuration:[indexPath row]*0.25 animations:^{cell.center = CGPointMake(cell.frame.size.width/2, cell.frame.size.height/2);} completion:nil];
    }

    if ([indexPath row] == 5) showAnimate = NO;
    
    return cell;
}

//Protocol -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    AdviceViewController* avc = [[AdviceViewController alloc] init];
    StartEndViewController* sevc = [[StartEndViewController alloc] init];
    [sevc setFunction:[allItems objectAtIndex:indexPath.row]];
    
    BSSearchBustopViewController* searchBustopViewController = [[BSSearchBustopViewController alloc] init];
    [searchBustopViewController setFunction:[allItems objectAtIndex:[indexPath row]]];
    
    BSSearchLineViewController* bslvc = [[BSSearchLineViewController alloc] init];
    [bslvc setFunction:[allItems objectAtIndex:[indexPath row]]];
    
    RealTimeTabViewController* rttvc = [[RealTimeTabViewController alloc] init];
    
    if (indexPath.row == 0) {
        [[self navigationController] pushViewController:searchBustopViewController animated:YES];
    }
    else  if (indexPath.row == 1) {
    [[self navigationController] pushViewController:bslvc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        [[self navigationController] pushViewController:sevc animated:YES];
    }
    else
    {
         [[self navigationController] pushViewController:rttvc animated:YES];
    }
}

-(void)addLables {
    UILabel* name = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 180, 60)];
    name.backgroundColor = [UIColor clearColor];
    name.text = @"Hermes";
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = [UIColor whiteColor];
    name.font = [UIFont fontWithName:@"Helvetica" size:35];
    [self.view addSubview:name];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
