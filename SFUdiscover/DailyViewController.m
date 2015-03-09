//
//  DailyViewController.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/7/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "DailyViewController.h"
#import "AppDelegate.h"

@interface DailyViewController ()
@property (weak, nonatomic) IBOutlet UITextView *showEvents;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation DailyViewController

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
    // Do any additional setup after loading the view.
    
    // Instantiate the appDelegate property, so we can access its eventManager property.
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // load events
    [self loadEvents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadEvents
{
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate distantFuture];
    
    EventManager *manager = self.appDelegate.eventManager;
    EKEventStore *store = [manager eventStore];
    NSPredicate *predicate = [store predicateForEventsWithStartDate:startDate
                                                            endDate:endDate
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
   NSString *results = @"";
    //NSString *results = nil;
    for (EKEvent *element in events) {
        NSString *title = element.title;
        NSString *calendar = element.calendar.title;
        NSString* startDate = [self.appDelegate.eventManager getStringFromDate:element.startDate];
        NSString* endDate = [self.appDelegate.eventManager getStringFromDate:element.startDate];
        NSString* eventDetails = [NSString stringWithFormat:@"%@ \n Belongs to: %@ \n %@ - %@", title, calendar, startDate, endDate];
        results = [NSString stringWithFormat:@"%@\n\n%@", results, eventDetails];
    }
    //NSString *results = [events componentsJoinedByString:@"\n"];
    
    // if ( results != NULL){
    if (![results isEqualToString: @""]){
        self.showEvents.text = results;
    }else{
        self.showEvents.text = @"nothing found";
    }
}

-(void)eventWasSuccessfullySaved{
    // Reload all events.
    [self viewDidLoad];
}

@end
