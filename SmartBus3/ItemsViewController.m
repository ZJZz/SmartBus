//
//  ItemsViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-13.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

-(id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        allItems =[[NSArray alloc] initWithObjects:@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"某某功能",@"更多", nil];
        [self transparent];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.view setFrame:CGRectMake(0, 140, 198, 320)];
    [self.tableView setFrame:CGRectMake(0, 140, 198, 320)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [[cell textLabel] setText:[allItems objectAtIndex:[indexPath row]]];
    [[cell textLabel] setTextAlignment:NSTextAlignmentRight];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    printf("%d\n",indexPath.row);
}

-(void)transparent {
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
