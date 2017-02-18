//
//  StartEndViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-8.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdviceViewController;

@interface StartEndViewController : UIViewController<UITextFieldDelegate>
{
    AdviceViewController* adviceViewController;
    UITextField*  startTextField,*endTextField;
}

@property (nonatomic,copy) NSString* function;

@end
