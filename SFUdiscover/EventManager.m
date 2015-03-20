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

-(NSString *)getStringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:@"d MMM yyyy, HH:mm"];
    NSString *stringFromDate = [dateFormatter stringFromDate:date];
    return stringFromDate;
}

@end


