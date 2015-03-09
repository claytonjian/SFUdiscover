//
//  ServicesViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.

/*
 Editors: Riku, James
 
 Changes: Go Back and Go Home IBActions implemented (James)
          Added Buttons and Button Borders (Riku)
 
 Known Bugs:
 */

#import <UIKit/UIKit.h>

@interface ServicesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *bookstoreButton;
@property (weak, nonatomic) IBOutlet UIButton *lostFoundButton;
@property (weak, nonatomic) IBOutlet UIButton *emergencyButton;
@property (weak, nonatomic) IBOutlet UIButton *safeWalkButton;
@property (weak, nonatomic) IBOutlet UIButton *restaurantButton;
@property (weak, nonatomic) IBOutlet UIButton *trafficButton;

@end
