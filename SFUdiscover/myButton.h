//
//  myButton.h
//  SFUdiscover
//
//  Created by Yixuan Li on 3/7/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface myButton : UIButton{
    MKPinAnnotationView *data;
}

@property (nonatomic, readwrite, retain) MKPinAnnotationView *data;
@end
