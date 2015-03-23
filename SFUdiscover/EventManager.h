//
//  EventManager.h
//  EventKitDemo
//
//  Created by Bonnie Ha on 2015-03-06.
//  Contributors: Bonnie Ha, James Voong
//
//  - Created and added needed objects (Bonnie)
//  - Go back and go home ibactions implemented (James)
//  - Button borders changed (Riku)
//
//  Known Bugs:
//
// Modified from http://www.appcoda.com/ios-event-kit-programming-tutorial/
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <Foundation/Foundation.h>
@import EventKit;

@interface EventManager : NSObject

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic) BOOL eventsAccessGranted;

@property (nonatomic, strong) NSString *selectedCalendarIdentifier;
@property (nonatomic, strong) NSMutableArray *arrCustomCalendarIdentifiers;

@property (nonatomic, strong) NSString *selectedEventIdentifier;

-(void)saveCustomCalendarIdentifier:(NSString *)identifier;


-(NSString *)getStringFromDate:(NSDate *)date;
-(NSArray *)getEventsOfSelectedCalendar;

-(NSArray *)getLocalEventCalendars;
-(BOOL)checkIfCalendarIsCustomWithIdentifier:(NSString *)identifier;

-(void)removeCalendarIdentifier:(NSString *)identifier;
-(void)deleteEventWithIdentifier:(NSString *)identifier;

@end



