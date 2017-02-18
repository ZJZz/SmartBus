//
//  StartEndViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-8.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "StartEndViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "AdviceViewController.h"

@interface StartEndViewController ()

@end

@implementation StartEndViewController
@synthesize function;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController customNavigationBar];
    [self.navigationItem setHidesBackButton:YES];
    
    UILabel* titleLable = [self.navigationController titleLable:function];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleLable];
    
    UIButton* backButton = [self.navigationController backButtonWith:[UIImage imageNamed:@"jiantou.png"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIImageView* background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    background.image = [UIImage imageNamed:@"search2"];
    [self.view addSubview:background];
    

    startTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 40, 240, 35)];
    [startTextField setPlaceholder:@"起始站 例:东软信息学院"];

    [startTextField setTag:1];
    [self configureFrom:startTextField name:[startTextField placeholder]];
    [self.view addSubview:startTextField];
    
    endTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 105, 240, 35)];
    [endTextField setPlaceholder:@"终点站 例:星海公园"];
    [endTextField setTag:2];
    [self configureFrom:endTextField name:[endTextField placeholder]];
    [self.view addSubview:endTextField];
    
    UISwipeGestureRecognizer* swipedown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [swipedown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipedown];
	
}

- (void)configureFrom:(UITextField*)from name:(NSString*)title
{
    [from setDelegate:self];
    [from setBorderStyle:UITextBorderStyleRoundedRect];
    [from setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [from setClearButtonMode:UITextFieldViewModeAlways];
    [from setClearsOnBeginEditing:YES];
}

-(void)hideKeyboard
{
    UIResponder* startResponder = [self.view viewWithTag:1];
    [startResponder resignFirstResponder];
    
    UIResponder* endResponder = [self.view viewWithTag:2];
    [endResponder resignFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1)
        [textField setReturnKeyType:UIReturnKeyDone];
    else if(textField.tag == 2)
        [textField setReturnKeyType:UIReturnKeySearch];
    
    [textField setEnablesReturnKeyAutomatically:YES];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    adviceViewController = [[AdviceViewController alloc] init];
    [adviceViewController setFunction:function];
    if (textField.tag == 2) {
        adviceViewController.startString = startTextField.text;
        adviceViewController.endString = endTextField.text;
        [self.navigationController pushViewController:adviceViewController animated:YES];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
