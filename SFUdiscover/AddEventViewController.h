//
//  AddEventViewController.h
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/7/15.
//  Contributors: Bonnie Ha
//
//  - Created (Bonnie)
//  - Successfully can save event (Bonnie)
//
//  Known Bugs:
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddEventViewControllerDelegate

-(void)eventWasSuccessfullySaved;

@end


@interface AddEventViewController : UIViewController
@property (nonatomic, strong) id<AddEventViewControllerDelegate> delegate;
@end
