//
//  BusOnMapViewController.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-7-21.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "BusOnMapViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "BMKPointAnnotation.h"
#import "BMKPinAnnotationView.h"
#import "BusInfoView.h"
#import "NSString+URLEncoder.h"


@interface BusOnMapViewController ()

@end

@implementation BusOnMapViewController

@synthesize lineNumber,netData;


- (void)viewWillAppear:(BOOL)animated
{
    [mapView viewWillAppear];
    mapView.delegate = self;
}

//- (void)viewDidAppear:(BOOL)animated
//{

//    
//    
//}

- (void)viewWillDisappear:(BOOL)animated
{
    [mapView viewWillDisappear];
    mapView.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    netData = [[NSMutableData alloc] init];
    once = true;
    
    

    
    
    //网络请求
    //http://112.124.9.46:8080/Bus/android/line?routeName=901路
    //    NSString* urlString = @"http://112.124.9.46:8080/Bus/android/line?routeName=901%E8%B7%AF";
    NSString* urlString = [[NSString stringWithFormat:@"http://112.124.9.46:8080/Bus/android/line?routeName=%@",lineNumber] URLEncodedString];
    
    NSURL* url = [NSURL URLWithString:urlString];
    //    NSLog(@"%@",url);
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    busInfoView = [[BusInfoView alloc] initWithFrame:CGRectMake(0, 0, 320, 161)];
    [self.view addSubview:busInfoView];
    [busInfoView.back addTarget:self action:@selector(returnBack) forControlEvents:UIControlEventTouchUpInside];
    
    mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 145, 320, 266)];
    [mapView setShowsUserLocation:YES];
    [mapView setZoomLevel:15.0f];
    [self.view addSubview:mapView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) returnBack
{
    [self.navigationController back];
}

#pragma mark - BMKMapView Method

- (void)mapView:(BMKMapView *)mapViewA didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    if (userLocation != nil) {
//        NSLog(@"%f %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    }
    if(once == true)
    {
        [mapViewA setCenterCoordinate:userLocation.coordinate];
        once = false;
    }
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapViewA viewForAnnotation:(id<BMKAnnotation>)annotation
{
    NSString* AnnotationViewID = @"renameMark";
    
    BMKAnnotationView* newAnnotation = [mapViewA dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (newAnnotation == nil) {
        newAnnotation = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        
        // 设置颜色
		((BMKPinAnnotationView*)newAnnotation).pinColor = BMKPinAnnotationColorPurple;
        // 从天上掉下效果
		((BMKPinAnnotationView*)newAnnotation).animatesDrop = YES;
        // 设置可拖拽
		((BMKPinAnnotationView*)newAnnotation).draggable = YES;
		return newAnnotation;
    }
    return nil;
}

#pragma mark - Net Work

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [netData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    NSLog(@"-------------connectionDidFinishLoading:");
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:netData options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@",dict);
    [busInfoView reloadData:dict];
    
    coordinateArray = [[NSMutableArray alloc] init];
//    
//    int busCount = [[dict objectForKey:@"busList"] count];
//    
//    for (int i = 0; i < busCount; i++)
//    {
//        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc] init];
//        CLLocationCoordinate2D coor;
//        //38.895046 121.542650
//        coor.latitude = [[[[dict objectForKey:@"busList"] objectAtIndex:i] objectForKey:@"lat"] doubleValue];
//        coor.longitude = [[[[dict objectForKey:@"busList"] objectAtIndex:i] objectForKey:@"lng"] doubleValue];;
//        annotation.coordinate = coor;
//        
//        annotation.title = @"HaHa";
//        annotation.title = @"HeHe";
//        [coordinateArray addObject:annotation];
//    }
//
  
    BMKPointAnnotation* annotation1 = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor1;
    coor1.latitude = 38.913994;
    coor1.longitude = 121.629635;
    annotation1.coordinate = coor1;
    [coordinateArray addObject:annotation1];
    
    BMKPointAnnotation* annotation2 = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor2;
    coor2.latitude = 38.899416;
    coor2.longitude = 121.597256;
    annotation2.coordinate = coor2;
    [coordinateArray addObject:annotation2];
    
    
    BMKPointAnnotation* annotation3 = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor3;
    coor3.latitude = 38.910771;
    coor3.longitude = 121.62058;
    annotation3.coordinate = coor3;
    [coordinateArray addObject:annotation3];
    
    BMKPointAnnotation* annotation4 = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor4;
    coor4.latitude = 38.884419;
    coor4.longitude = 121.544663;
    annotation4.coordinate = coor4;
    [coordinateArray addObject:annotation4];
    
    BMKPointAnnotation* annotation5 = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor5;
    coor5.latitude = 38.887074;
    coor5.longitude = 121.528656;
    annotation5.coordinate = coor5;
    [coordinateArray addObject:annotation5];
    
    
    
    [mapView addAnnotations:coordinateArray];
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    conn = nil;
    NSString* errorString = [NSString stringWithFormat:@"Fetch failed: %@",[error localizedDescription]];
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [av show];
}






@end
