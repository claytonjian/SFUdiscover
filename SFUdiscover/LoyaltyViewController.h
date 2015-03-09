//
//  LoyaltyViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Riku Kenju
//
//  - Created (Riku)
//  - Added button outlets (Riku)
//
//  Known Bugs:
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//
//  02-27 created.
//  03-01 Added outlets
//  03-04 Added outlets for buttons on view
//

#import <UIKit/UIKit.h>

@interface LoyaltyViewController : UIViewController{
    //outlet for scrolling
    IBOutlet UIScrollView *scroller;
}

//following UIButton outlets are used for formatting
@property (weak, nonatomic) IBOutlet UIButton *redeemButton;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;
@property (weak, nonatomic) IBOutlet UIButton *participantButton;
@property (weak, nonatomic) IBOutlet UIButton *QRScanButton;

@end
