//
//  AddEventTableViewController.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "AddEventTableViewController.h"
#import "AppDelegate.h"

@interface AddEventTableViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *calendarSelectLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;

@end

@implementation AddEventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Instantiate the appDelegate property, so we can access its eventManager property.
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveEvent:(id)sender {
    
    // Check if a title was typed in for the event.
    //if (self.nameTextField.text.length == 0) {
        // In this case, just do nothing.
        //return;
    //}
    [self.nameTextField resignFirstResponder];
    
    // Check if a start and an end date was selected for the event.
    if (self.startDatePicker == nil || self.endDatePicker == nil) {
        // In this case, do nothing too.
        return;
    }
    
    // Create a new event object.
    EKEvent *event = [EKEvent eventWithEventStore:self.appDelegate.eventManager.eventStore];
    
    // Set the event title.
    event.title = self.nameTextField.text;
    
    // Set its calendar
    event.calendar = [self createCalendar];
    
    // Set the start and end dates to the event.
    event.startDate = self.startDatePicker.date;
    event.endDate = self.endDatePicker.date;
    
    
    // Save and commit the event.
    NSError *error;
    if ([self.appDelegate.eventManager.eventStore saveEvent:event span:EKSpanFutureEvents commit:YES error:&error]) {
        // Call the delegate method to notify the caller class (the ViewController class) that the event was saved.
        [self.delegate eventWasSuccessfullySaved];
        
        // Pop the current view controller from the navigation stack.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        // An error occurred, so log the error description.
        NSLog(@"%@", [error localizedDescription]);
    }
    
}

-(EKCalendar *)createCalendar{
    
    //[self.eventCalendar resignFirstResponder];
    
    // Create a new calendar.
    EKCalendar *calendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent
                                                  eventStore:self.appDelegate.eventManager.eventStore];
    
    // Set the calendar title.
    calendar.title = @"Default Calendar Name";
    
    // Find the proper source type value.
    for (int i=0; i<self.appDelegate.eventManager.eventStore.sources.count; i++) {
        EKSource *source = (EKSource *)[self.appDelegate.eventManager.eventStore.sources objectAtIndex:i];
        EKSourceType currentSourceType = source.sourceType;
        
        if (currentSourceType == EKSourceTypeLocal) {
            calendar.source = source;
            break;
        }
    }
    
    // Save and commit the calendar.
    NSError *error;
    [self.appDelegate.eventManager.eventStore saveCalendar:calendar commit:YES error:&error];
    
    // If no error occurs then turn the editing mode off, store the new calendar identifier and reload the calendars.
    if (error == nil) {
        
        // Store the calendar identifier.
        [self.appDelegate.eventManager saveCustomCalendarIdentifier:calendar.calendarIdentifier];
        return calendar;
        
    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [error localizedDescription]);
        return nil;
    }
    
}

- (IBAction)cancelEvent:(id)sender {
    
    // Pop the current view controller from the navigation stack.
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
