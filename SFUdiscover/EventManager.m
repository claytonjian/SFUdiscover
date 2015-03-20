//
//  EventManager.m
//  EventKitDemo
//
//  Created by Bonnie Ha on 2015-03-06.
// Modified from http://www.appcoda.com/ios-event-kit-programming-tutorial/
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "EventManager.h"

@implementation EventManager

-(EventManager *)init {
    self = [super init];
    
    if (self) {
        
        self.eventStore = [[EKEventStore alloc] init];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        // Check if the access granted value for the events exists in the user defaults dictionary.
        if ([userDefaults valueForKey:@"eventkit_events_access_granted"] != nil) {
            // The value exists, so assign it to the property.
            self.eventsAccessGranted = [[userDefaults valueForKey:@"eventkit_events_access_granted"] intValue];
        }
        else{
            // Set the default value.
            self.eventsAccessGranted = NO;
        }
        
        // Load the custom calendar identifiers (if exist).
        if ([userDefaults objectForKey:@"eventkit_cal_identifiers"] != nil) {
            self.arrCustomCalendarIdentifiers = [userDefaults objectForKey:@"eventkit_cal_identifiers"];
        }
        else{
            self.arrCustomCalendarIdentifiers = [[NSMutableArray alloc] init];
        }
        
        // Load the selected calendar identifier.
        if ([userDefaults objectForKey:@"eventkit_selected_calendar"] != nil) {
            self.selectedCalendarIdentifier = [userDefaults objectForKey:@"eventkit_selected_calendar"];
        }
        else{
            self.selectedCalendarIdentifier = @"";
        }
        
        
    }
    
    return self;
    
}


-(void)setEventsAccessGranted:(BOOL)eventsAccessGranted{
    _eventsAccessGranted = eventsAccessGranted;
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:eventsAccessGranted] forKey:@"eventkit_events_access_granted"];
}



-(void)saveCustomCalendarIdentifier:(NSString *)identifier{
    [self.arrCustomCalendarIdentifiers addObject:identifier];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.arrCustomCalendarIdentifiers forKey:@"eventkit_cal_identifiers"];
}

// Return the given date in string format
-(NSString *)getStringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:@"d MMM yyyy, HH:mm"];
    NSString *stringFromDate = [dateFormatter stringFromDate:date];
    return stringFromDate;
}

// Return array of all events
-(NSArray *)getEventsOfSelectedCalendar{
    // Specify the calendar that will be used to get the events from.
    EKCalendar *calendar = nil;
    /*if (self.selectedCalendarIdentifier != nil && self.selectedCalendarIdentifier.length > 0) {
        calendar = [self.eventStore calendarWithIdentifier:self.selectedCalendarIdentifier];
    }*/
    
    // If no selected calendar identifier exists and the calendar variable has the nil value, then all calendars will be used for retrieving events.
    NSArray *calendarsArray = nil;
    if (calendar != nil) {
        calendarsArray = @[calendar];
    }
    
    
    // Create a predicate value with start date a year before and end date a year after the current date.
    int yearSeconds = 365 * (60 * 60 * 24);
    NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:[NSDate dateWithTimeIntervalSinceNow:-yearSeconds] endDate:[NSDate dateWithTimeIntervalSinceNow:yearSeconds] calendars:calendarsArray];
    
    // Get an array with all events.
    NSArray *eventsArray = [self.eventStore eventsMatchingPredicate:predicate];
    
    // Sort the array based on the start date.
    eventsArray = [eventsArray sortedArrayUsingSelector:@selector(compareStartDateWithEvent:)];
    
    // Return that array.
    return eventsArray;
}

@end


