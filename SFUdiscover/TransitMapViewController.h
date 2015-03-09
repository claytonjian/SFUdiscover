//
//  TransitMapViewController.h
//  SFUdiscover
//
//  Created by Yixuan Li on 3/5/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>

@class TransitMapViewController;
@protocol TransitMapViewControllerDelegate <NSObject>

- (void) passBack:(TransitMapViewController *) controller busStop:(NSString *)input;
- (IBAction)goHome:(id)sender;
- (void) goSetting;
@end

@interface TransitMapViewController : UIViewController <MKMapViewDelegate>{
    MKMapView *mapView;
    NSString *selection;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSString *selection;
@property (nonatomic, weak) id<TransitMapViewControllerDelegate> TMVCDelegate;

@end