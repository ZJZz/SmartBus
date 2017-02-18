//
//  BusOnMapViewController.h
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-21.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMKMapView.h"

@class StationInfo;
@class BusInfoView;

@interface BusOnMapViewController : UIViewController<BMKMapViewDelegate,NSURLConnectionDataDelegate>
{
    BMKMapView* mapView;
    StationInfo* stationInfo;
    BusInfoView* busInfoView;
    BOOL once;
    NSMutableArray* coordinateArray;
}

@property (nonatomic,copy) NSString* lineNumber;//为BusInfoView传参
@property (nonatomic,retain) NSMutableData* netData;

@end
