//
//  AgendaViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/8/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "AgendaViewController.h"
#import "AppDelegate.h"

@interface AgendaViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation AgendaViewController

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:(YES)];
}
- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:(YES)];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Make self the delegate and datasource of the table view
    self.tableEvents.delegate = self;
    self.tableEvents.dataSource = self;
    
    // Instantiate the appDelegate property, so we can access its eventManager property
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Load the events with a small delay, so the store event gets ready
    [self performSelector:@selector(loadEvents) withObject:nil afterDelay:0.5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"idSegueAgendaAddEvent"]) {
        AddEventTableViewController *addEventTableViewController = [segue destinationViewController];
        addEventTableViewController.delegate = self;
    }
    
}


// Display events
-(void)loadEvents{
    if (self.appDelegate.eventManager.eventsAccessGranted) {
        
        // Get events
        self.arrEvents = [self.appDelegate.eventManager getEventsOfSelectedCalendar];
        
        // Reload view
        [self.tableEvents reloadData];
    }
}

#pragma mark - EditEventViewControllerDelegate method implementation

// Upon saving a new event, reload events' display
-(void)eventWasSuccessfullySaved{
    
    // Reload all events.
    [self loadEvents];
}

#pragma mark - UITableView Delegate and Datasource method implementation

// Get the number of rows needed
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    // return number of events
    return self.arrEvents.count;
}

// Displace cell content
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellEvent"];
    
    // Get each single event
    EKEvent *event = [self.arrEvents objectAtIndex:indexPath.row];
    
    
    
    // Set event title to the cell's text label
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", event.title, event.calendar.title];
    
    
    // Get the event start date as a string value
    NSString *startDateString = [self.appDelegate.eventManager getStringFromDate:event.startDate];
    
    // Get the event end date as a string value
    NSString *endDateString = [self.appDelegate.eventManager getStringFromDate:event.endDate];
    
    // Concatenate the start and end date strings and set to the cell's detail text label
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", startDateString, endDateString];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    // Keep the identifier of the event that's about to be edited.
    self.appDelegate.eventManager.selectedEventIdentifier = [[self.arrEvents objectAtIndex:indexPath.row] eventIdentifier];
    
    // Perform the segue.
    [self performSegueWithIdentifier:@"idSegueAgendaAddEvent" sender:self];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the selected event.
        [self.appDelegate.eventManager deleteEventWithIdentifier:[[self.arrEvents objectAtIndex:indexPath.row] eventIdentifier]];
        
        // Reload all events and the table view.
        [self loadEvents];
    }
}

@end
