//
//  NavigationViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface NavigationViewController : UIViewController
    
@property (weak, nonatomic) IBOutlet MKMapView *navigationMapView;

@end
