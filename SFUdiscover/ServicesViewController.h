//
//  ServicesViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: James Voong, Riku Kenju, Clayton Jian
//
//  - Go back and go home IBActions implemented (James)
//  - Added buttons and button borders (Riku)
//
//  Known Bugs:
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.

#import <UIKit/UIKit.h>

@interface ServicesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *bookstoreButton;
@property (weak, nonatomic) IBOutlet UIButton *lostFoundButton;
@property (weak, nonatomic) IBOutlet UIButton *emergencyButton;
@property (weak, nonatomic) IBOutlet UIButton *safeWalkButton;
@property (weak, nonatomic) IBOutlet UIButton *restaurantButton;
@property (weak, nonatomic) IBOutlet UIButton *trafficButton;

@end
