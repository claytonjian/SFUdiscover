//
//  HomeViewController.h
//  Header file of the Home View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, Yixuan Li
//
//  - Created delegation for transit map
//  - Declared all function buttons
//  - Declared keychain
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLoginViewController.h"

@interface HomeViewController : UIViewController <UserLoginViewControllerDelegate>{
    JNKeychain *kc;
}
@property (weak, nonatomic) IBOutlet UIButton *canvasButton;
@property (weak, nonatomic) IBOutlet UIButton *connectButton;
@property (weak, nonatomic) IBOutlet UIButton *feedbackButton;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property (weak, nonatomic) IBOutlet UIButton *navButton;
@property (weak, nonatomic) IBOutlet UIButton *transitButton;
@property (weak, nonatomic) IBOutlet UIButton *loyaltyButton;
@property (weak, nonatomic) IBOutlet UIButton *nfButton;
@property (weak, nonatomic) IBOutlet UIButton *serviceButton;
@property (weak, nonatomic) IBOutlet UIButton *libButton;

@end
