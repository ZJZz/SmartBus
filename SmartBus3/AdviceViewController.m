//
//  AdviceViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-8.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "AdviceViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "AdviceDetailCell.h"
#import "NSString+URLEncoder.h"

@interface AdviceViewController ()

@end

@implementation AdviceViewController
@synthesize function,startString,endString,netData,netArray;

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    netData = [[NSMutableData alloc] init];
    netArray = [[NSArray alloc] init];
    netFinish = NO;
    contentTableViewArray = [[NSMutableArray alloc] init];
    
//http://112.124.9.46:8080/Bus/android/advice?startName=软件园路&endName=沙河口火车站
    NSString* urlString = [[NSString stringWithFormat:@"http://112.124.9.46:8080/Bus/android/advice?startName=%@&endName=%@",startString,endString] URLEncodedString];
    NSLog(@"urlString %@",urlString);
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController customNavigationBar];
    [self.navigationItem setHidesBackButton:YES];
    
    UILabel* titleLable = [self.navigationController titleLable:function];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleLable];
    
    UIButton* backButton = [self.navigationController backButtonWith:[UIImage imageNamed:@"jiantou.png"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    myCollapseClick = [[CollapseClick alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    myCollapseClick.CollapseClickDelegate = self;
    [myCollapseClick reloadCollapseClick];
    [myCollapseClick setScrollEnabled:YES];
    [myCollapseClick setAutoresizesSubviews:YES];
    [self.view addSubview:myCollapseClick];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collapse Click Delegate


// Required Methods
-(int)numberOfCellsForCollapseClick {
    if (netFinish)
    {
        if ([netArray count] < 4 )
            return [netArray count];
        else
            return 4;
    }
    return 0;
}

- (NSString *)titleForCollapseClickAtIndex:(int)index
{
//    NSLog(@"titleForCollapseClickAtIndex:(int)index");
    NSString* title = [[NSString alloc] init];
    title = @"";
    if( netFinish )
    {
//        NSLog(@"netFinish = TRUE");
        NSString* wayNumber = [[NSString alloc] init];
        wayNumber = [[netArray objectAtIndex:index] objectForKey:@"way"];
        NSString* changeCount = [[NSString alloc] init];
        changeCount = [[netArray objectAtIndex:index] objectForKey:@"changeCount"];
        NSString* allStationCount = [[NSString alloc] init];
        allStationCount = [[netArray objectAtIndex:index] objectForKey:@"count"];
        title = [NSString stringWithFormat:@"%@ 换乘%@次 共%@站",wayNumber,changeCount,allStationCount];
        return title;
    }
   
    return title;
}

- (UIView *)viewForCollapseClickContentViewAtIndex:(int)index
{
    if (netFinish == TRUE) {
        return [contentTableViewArray objectAtIndex:index];
    }
    return nil;
}

// Optional Methods

-(UIColor *)colorForCollapseClickTitleViewAtIndex:(int)index {
    return [UIColor colorWithRed:0.0f/255.0f green:108.0f/255.0f blue:171.0f/255.0f alpha:1];
}


-(UIColor *)colorForTitleLabelAtIndex:(int)index {
    return [UIColor colorWithWhite:1.0 alpha:0.85];
}

-(UIColor *)colorForTitleArrowAtIndex:(int)index {
    return [UIColor colorWithWhite:0.0 alpha:0.25];
}

-(void)didClickCollapseClickCellAtIndex:(int)index isNowOpen:(BOOL)open {
//    NSLog(@"%d and it's open:%@", index, (open ? @"YES" : @"NO"));
}

#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    int tablViewIndex = tableView.tag;
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView: cellForRowAtIndexPath:");
    static NSString* cellIdentifier = @"AdviceDetailCell";
    AdviceDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[AdviceDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell configureWayImage:indexPath.row];
    [cell configureTextLabel:indexPath.row];
    
    return cell;
}


#pragma mark - Net Work

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [netData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    netArray = [NSJSONSerialization JSONObjectWithData:netData options:NSJSONReadingAllowFragments error:nil];
    netFinish = TRUE;

    int contentViewCount = [netArray count] > 4 ? 4:[netArray count];
    for(int i=0; i < contentViewCount; i++)
    {
        UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 133) style:UITableViewStylePlain];
        tableView.tag = i;
        [tableView setDelegate:self];
        [tableView setDataSource:self];
        [contentTableViewArray addObject:tableView];
    }
    [myCollapseClick reloadCollapseClick];
    [self.view addSubview:myCollapseClick];
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    conn = nil;
    NSString* errorString = [NSString stringWithFormat:@"Fetch failed: %@",[error localizedDescription]];
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [av show];
}

@end
