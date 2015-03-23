//
//  AddEventTableViewController.h
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCalendarViewController.h"

@protocol AddEventTableViewControllerDelegate

- (void)eventWasSuccessfullySaved;

@end

@interface AddEventTableViewController : UITableViewController<SelectCalendarViewControllerDelegate>

@property (nonatomic, strong) id<AddEventTableViewControllerDelegate> delegate;

- (IBAction)saveEvent:(id)sender;

@property (nonatomic, strong) EKEvent *editedEvent;


@end
