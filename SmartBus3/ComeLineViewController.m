//
//  ComeLineViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-8.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "ComeLineViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "BusStopCell.h"
#import "NSString+URLEncoder.h"
#import "RealTimeTabViewController.h"

@interface ComeLineViewController ()
@end

@implementation ComeLineViewController
@synthesize function,searchBusStop;


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    netData = [[NSMutableData alloc] init];
    netArray = [[NSArray alloc] init];
    
//    NSLog(@"%@",searchBusStop);
    
    NSString* urlString = [[NSString stringWithFormat:@"http://112.124.9.46:8080/Bus/android/route?stopName=%@",searchBusStop] URLEncodedString];
    NSLog(@"urlString %@",urlString);
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController customNavigationBar];
    [self.navigationItem setHidesBackButton:YES];
    
    UILabel* titleLable = [self.navigationController titleLable:function];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleLable];
    
    UIButton* backButton = [self.navigationController backButtonWith:[UIImage imageNamed:@"jiantou.png"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [netArray count];
}

- (UITableViewCell*)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"BusStopCell";
    BusStopCell* cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[BusStopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary* myDict = [[NSDictionary alloc] init];
    myDict = [netArray objectAtIndex:indexPath.row];
    NSLog(@"myDict: %@",myDict);
    
    [cell configureNumberLabel:[[myDict objectForKey:@"route"] objectForKey:@"rName"]];
    [cell configureTimeLabel:[[myDict objectForKey:@"route"] objectForKey:@"rBegintime"] endTime:[[myDict objectForKey:@"route"] objectForKey:@"rEndtime"]];
    [cell configureStationLabel:[[myDict objectForKey:@"route"] objectForKey:@"rBegin"] rEnd:[[myDict objectForKey:@"route"] objectForKey:@"rEnd"]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)table didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RealTimeTabViewController* realTimeTabViewController = [[RealTimeTabViewController alloc] init];
    BusStopCell* cell = [[BusStopCell alloc] init];
    cell = (BusStopCell *)[table cellForRowAtIndexPath:indexPath];
    NSString* lineNumber = cell.numberLabel.text;
    realTimeTabViewController.searchLineNumber = lineNumber;
    [self.navigationController pushViewController:realTimeTabViewController animated:YES];
}


#pragma mark -  Net Work

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [netData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    netArray = [NSJSONSerialization JSONObjectWithData:netData options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@",netArray);
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [self.view addSubview:tableView];
    
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    conn = nil;
    NSString* errorString = [NSString stringWithFormat:@"Fetch failed: %@",[error localizedDescription]];
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [av show];
}

@end
