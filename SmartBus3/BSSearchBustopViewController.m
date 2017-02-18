//
//  BSSearchBustopViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-14.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BSSearchBustopViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "ComeLineViewController.h"

@interface BSSearchBustopViewController ()

@end

@implementation BSSearchBustopViewController

@synthesize function;

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController customNavigationBar];
    [self.navigationItem setHidesBackButton:YES];
    UIButton* backButton = [self.navigationController backButtonWith:[UIImage imageNamed:@"jiantou.png"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    linenumber = nil;

    UIImageView* background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    background.image = [UIImage imageNamed:@"search2"];
    [self.view addSubview:background];
    

    
    UILabel* titleLable = [self.navigationController titleLable:function];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleLable];
    
    UITextField*  from = [[UITextField alloc] initWithFrame:CGRectMake(50, 40, 220, 35)];
    [from setPlaceholder:@"请输入站点名称"];
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
    [textField resignFirstResponder];
    comeLineViewController = [[ComeLineViewController alloc] init];
    [comeLineViewController setFunction:function];
//    NSLog(@"%@",textField.text);
    [comeLineViewController setSearchBusStop:textField.text];
    [self.navigationController pushViewController:comeLineViewController animated:YES];
    return NO;
}

#pragma mark 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
