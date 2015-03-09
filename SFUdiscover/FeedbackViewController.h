//
//  FeedbackViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Riku Kenju
//
//  - Created (Riku)
//  - Added button outlets and scroll view controller (Riku)
//
//  Known Bugs:
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackViewController : UIViewController {
    IBOutlet UIScrollView *scroller;
}
@property (weak, nonatomic) IBOutlet UIButton *sendToSFUButton;
@property (weak, nonatomic) IBOutlet UIButton *sendToLibButton;
@property (weak, nonatomic) IBOutlet UIButton *sendToDiningButton;
@property (weak, nonatomic) IBOutlet UIButton *sendToDevsButton;

@end
