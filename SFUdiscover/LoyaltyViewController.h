//
//  LoyaltyViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoyaltyViewController : UIViewController{
    IBOutlet UIScrollView *scroller;
}
@property (weak, nonatomic) IBOutlet UIButton *redeemButton;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;
@property (weak, nonatomic) IBOutlet UIButton *participantButton;
@property (weak, nonatomic) IBOutlet UIButton *QRScanButton;

@end
