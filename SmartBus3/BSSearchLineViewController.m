//
//  BSSearchLineViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-5.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BSSearchLineViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "RealTimeTabViewController.h"


@interface BSSearchLineViewController ()

@end

@implementation BSSearchLineViewController

@synthesize function;

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController customNavigationBar];
    [self.navigationItem setHidesBackButton:YES];
    
    linenumber = nil;
    
    UIImageView* background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    background.image = [UIImage imageNamed:@"search2"];
    [self.view addSubview:background];
    
    UIButton* backButton = [self.navigationController backButtonWith:[UIImage imageNamed:@"jiantou.png"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UILabel* titleLable = [self.navigationController titleLable:function];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleLable];
    
    UITextField*  from = [[UITextField alloc] initWithFrame:CGRectMake(50, 40, 220, 35)];
    [from setPlaceholder:@"请输入线路号"];
    [from setTag:1];
    [self configureFrom:from name:[from placeholder]];
    [self.view addSubview:from];
    
    UISwipeGestureRecognizer* swipedown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [swipedown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipedown];
}

-(void)hideKeyboard
{
    UIResponder* fromResponder = [self.view viewWithTag:1];
    [fromResponder resignFirstResponder];
}

- (void)configureFrom:(UITextField*)from name:(NSString*)title
{
    [from setDelegate:self];
    [from setBorderStyle:UITextBorderStyleRoundedRect];
    [from setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [from setClearButtonMode:UITextFieldViewModeAlways];
    [from setClearsOnBeginEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField setReturnKeyType:UIReturnKeySearch];
    [textField setEnablesReturnKeyAutomatically:YES];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
    [textField resignFirstResponder];
    realTimeTableViewController = [[RealTimeTabViewController alloc] init];
    [realTimeTableViewController setSearchLineNumber:textField.text];
    [self.navigationController pushViewController:realTimeTableViewController animated:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


