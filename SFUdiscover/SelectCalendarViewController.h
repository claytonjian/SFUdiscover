//
//  SelectCalendarViewController.h
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectCalendarViewControllerDelegate

- (void)selectedCalendar;

@end


@interface SelectCalendarViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *calendarTableView;
@property (nonatomic, strong) NSArray *calendarArray;

@property (nonatomic, strong) id<SelectCalendarViewControllerDelegate> delegate;


@end
