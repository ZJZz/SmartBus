//
//  BusDetailViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-22.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BusDetailViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "StationInfo.h"
#import "BusInfoView.h"
#import "MyCell.h"
#import "NSString+URLEncoder.h"

@interface BusDetailViewController ()
@end

@implementation BusDetailViewController

@synthesize busMessage,lineNumber,netData;

- (void)viewDidLoad
{
    [super viewDidLoad];

//    NSUserDefaults
    pressed = NO;//popView相关
    alertFlagArray =[[NSMutableArray alloc] init];
    netData = [[NSMutableData alloc] init];
 
    

    
    
    //网络请求
    //http://112.124.9.46:8080/Bus/android/line?routeName=901路
    //    NSString* urlString = @"http://112.124.9.46:8080/Bus/android/line?routeName=901%E8%B7%AF";
    
    NSString* urlString = [[NSString stringWithFormat:@"http://112.124.9.46:8080/Bus/android/line?routeName=%@",lineNumber] URLEncodedString];
    
    NSURL* url = [NSURL URLWithString:urlString];
//    NSLog(@"%@",url);
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    

    //设置NavigationController
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //设置BusInfoView
    busInfoView = [[BusInfoView alloc] initWithFrame:CGRectMake(0, 0, 320, 161)];
    [self.view addSubview:busInfoView];
    
    //为返回按钮添加动作
    [busInfoView.back addTarget:self action:@selector(returnBack) forControlEvents:UIControlEventTouchUpInside];
    

    
    //添加GestureRecognizer 取消PopView
    UITapGestureRecognizer* cancelPop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removePop)];
    [self.view addGestureRecognizer:cancelPop];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    MyCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
         cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    for (UIView * aView in cell.contentView.subviews) {
        [aView removeFromSuperview];
    }
    
//    NSMutableArray* stationInfoArray = [stationInfo stationInfos];
//    StationInfo * stationInfoInstance = [stationInfoArray objectAtIndex:indexPath.row];
//    NSString* number = [stationInfoInstance number];
//    int congestionState = [stationInfoInstance congestionState];
//    NSString* stationName = [stationInfoInstance stationName];

    
    NSArray* linesArray = [[NSArray alloc] init];
    linesArray = [netDict objectForKey:@"lines"];
    
    NSString* numberString = [NSString stringWithFormat:@"%@",[[linesArray objectAtIndex:indexPath.row] objectForKey:@"position"]];
    NSString* number = [[NSString alloc] init];
    number = numberString;
    
    int congestionState = [[[linesArray objectAtIndex:indexPath.row] objectForKey:@"status"] intValue];
    
    NSString* stationName = [[NSString alloc] init];
    stationName = [[linesArray objectAtIndex:indexPath.row] objectForKey:@"stop_name"];
    NSLog(@"number: %@ congestionState: %d stationName: %@",number,congestionState,stationName);
    
    
    [cell configureNumberButton:number];
    [cell.numberButton addTarget:self action:@selector(showBusMessage) forControlEvents:UIControlEventTouchUpInside];
    [cell configureRoadView:congestionState];
    
    
    if ( [number intValue] % 7 == 0 )
    {
        [cell addBus:indexPath.row %3];
    }
    
    
    [cell configureSatationNameLable:stationName];
    [cell configureArriveAlertSwitch];
    
    [alertFlagArray addObject:[NSNumber numberWithBool:NO]];
    [cell.arriveAlertSwitch setOn:[[alertFlagArray objectAtIndex:indexPath.row] boolValue]];
    [cell.arriveAlertSwitch addTarget:self action:@selector(SetttingAlert:) forControlEvents:UIControlEventValueChanged];
    
    return cell;
}

- (void)SetttingAlert:(UISwitch*)sender
{
    UITableViewCell* ownerCell = (UITableViewCell*)sender.superview;
    if (ownerCell != nil) {
        NSIndexPath* ownerCellIndexPath = [tableview indexPathForCell:ownerCell];
//        NSLog(@"%@",ownerCellIndexPath);
       
        [alertFlagArray replaceObjectAtIndex:ownerCellIndexPath.row withObject:[NSNumber numberWithBool:sender.on]];
//        NSLog(@"%@",[alertFlagArray objectAtIndex:ownerCellIndexPath.row]);
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[netDict objectForKey:@"lines"] count];
}

- (void) returnBack
{
    [self.navigationController back];
}

- (void)showBusMessage
{
    if( busMessage == nil && pressed == NO)
    {
        pressed = YES;
        
        busMessage = [[UIView alloc] initWithFrame:CGRectMake(60, 180, 200, 170)];
        [busMessage setBackgroundColor:[UIColor blackColor]];
        [busMessage setAlpha:0.75];
        busMessage.layer.cornerRadius = 5;
        
        UILabel* busId = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
//        [busId setBackgroundColor:[UIColor redColor]];
        [busId setBackgroundColor:[UIColor clearColor]];
        [busId setText:@"BUS A"];

        [busId setTextColor:[UIColor whiteColor]];
        [busId setTextAlignment:NSTextAlignmentLeft];
        [busMessage addSubview:busId];
        
        UILabel* remainStop = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 30)];
        [remainStop setBackgroundColor:[UIColor clearColor]];
//        [remainStop setBackgroundColor:[UIColor greenColor]];
        [remainStop setText:@"剩余站:1"];
        [remainStop setTextColor:[UIColor whiteColor]];
        [remainStop setTextAlignment:NSTextAlignmentLeft];
        [busMessage addSubview:remainStop];
        
        UILabel* remainTime = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 120, 30)];
        [remainTime setBackgroundColor:[UIColor clearColor]];
//        [remainTime setBackgroundColor:[UIColor purpleColor]];
        [remainTime setText:@"预计到达时间:2"];
        [remainTime setTextColor:[UIColor whiteColor]];
        [remainTime setTextAlignment:NSTextAlignmentLeft];
        [busMessage addSubview:remainTime];
        
        UILabel* passenger = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, 80, 30)];
        [passenger setBackgroundColor:[UIColor clearColor]];
//        [passenger setBackgroundColor:[UIColor brownColor]];
        [passenger setText:@"人数:10"];
        [passenger setTextColor:[UIColor whiteColor]];
        [passenger setTextAlignment:NSTextAlignmentLeft];
        [busMessage addSubview:passenger];
        
        [self.view addSubview:busMessage];
    }
    return;
}

- (void)removePop
{
    if (busMessage != nil) {
        [busMessage removeFromSuperview];
        busMessage = nil;
        pressed = NO;
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [netData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    netDict = [[NSDictionary alloc] init];
    netDict = [NSJSONSerialization JSONObjectWithData:netData options:NSJSONReadingMutableContainers error:nil];

//    StationInfo* stationInfo =[[StationInfo alloc] init];
//    stationInfo.linesArray = [netDict objectForKey:@"lines"];
//    NSLog(@"%@",[netDict objectForKey:@"lines"]);
    
    [busInfoView reloadData:netDict];
    
    stationInfo = [[StationInfo alloc] init];
    stationInfo.linesArray = [netDict objectForKey:@"lines"];
    
    //设置TableView
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 145, 320, 266) style:UITableViewStylePlain];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [tableview setAllowsSelection:NO];
    [self.view addSubview:tableview];
    
    
 
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    conn = nil;
    NSString* errorString = [NSString stringWithFormat:@"Fetch failed: %@",[error localizedDescription]];
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [av show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
