//
//  SelectCalendarViewController.h
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
@import EventKit;

@protocol SelectCalendarViewControllerDelegate

- (void)selectedCalendar:(EKCalendar *)calendar;

@end


@interface SelectCalendarViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *calendarTableView;
@property (nonatomic, strong) NSArray *calendarArray;
@property (nonatomic, strong) NSString *selectedCalendar;

@property (nonatomic, strong) id<SelectCalendarViewControllerDelegate> delegate;

-(void)createCalendar;


@end
