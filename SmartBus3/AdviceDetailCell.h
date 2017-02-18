//
//  AdviceDetailCell.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-9.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviceDetailCell : UITableViewCell

@property (nonatomic,strong) UIImageView* wayImage;
@property (nonatomic,strong) UILabel* textLabel;

- (void)configureWayImage:(NSInteger)row;
- (void)configureTextLabel:(NSInteger)row;

@end
