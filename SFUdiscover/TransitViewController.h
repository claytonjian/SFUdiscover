//
//  TransitViewController.h
//  Header file for the Transit View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, Yixuan Li
//
//  - Created delegation for transit map
//  - Declaration of button to other views
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitMapViewController.h"

@interface TransitViewController : UIViewController <TransitMapViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *mapButton;
@property (weak, nonatomic) IBOutlet UIButton *busSchedButton;

@end
