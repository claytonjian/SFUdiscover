//
//  TransitMapViewController.m
//  Header file for the Transit Map View Controller
//
//  SFUdiscover
//
//  Created by Yixuan Li on 2015-02-28.
//  Contributors: Yixuan Li
//
//  - Setup protocol for delegation to pass user selection data back to transit menu
//  - Declared the display map, user selection, and delegate
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>

@class TransitMapViewController;
@protocol TransitMapViewControllerDelegate <NSObject>

- (void) passBack:(TransitMapViewController *) controller busStop:(NSString *)input number:(int) num;
- (IBAction)goHome:(id)sender;
@end

@interface TransitMapViewController : UIViewController <MKMapViewDelegate>{
    MKMapView *mapView;
    NSString *selection;
    int stopNum;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSString *selection;
@property (nonatomic) int stopNum;
@property (nonatomic, weak) id<TransitMapViewControllerDelegate> TMVCDelegate;

@end