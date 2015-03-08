//
//  EventManager.h
//  EventKitDemo
//
//  Created by Bonnie Ha on 2015-03-06.
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

-(void)saveCustomCalendarIdentifier:(NSString *)identifier;


-(NSString *)getStringFromDate:(NSDate *)date;


@end



