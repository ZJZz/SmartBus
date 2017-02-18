//
//  BSSearchBustopViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-14.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComeLineViewController;

@interface BSSearchBustopViewController : UIViewController<UITextFieldDelegate>
{
    NSString* function;
    NSString* linenumber;
    ComeLineViewController* comeLineViewController;
}

@property (nonatomic,copy) NSString* function;

@end
