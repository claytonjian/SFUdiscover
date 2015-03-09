//
//  BusTableViewController.m
//  Implemenation file for the Bus Table View Controller
//
//  SFUdiscover
//
//  Created by Yixuan Li on 2015-03-01.
//  Contributors: Yixuan Li
//
//  - Display the bus table using user selection pass through previous view via delegation
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "BusTableViewController.h"

@interface BusTableViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *tableDisplay;

@end

@implementation BusTableViewController
@synthesize busNumber;

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
    // Display bus table based on user selection on previous view
    
    NSURL *myURL;
    switch (busNumber) {
        case 0:
            myURL = [NSURL URLWithString:@"http://infomaps.translink.ca/Public_Timetables/100/tt135.pdf"];
            break;
        case 1:
            myURL = [NSURL URLWithString:@"http://infomaps.translink.ca/Public_Timetables/100/tt143.pdf"];
            break;
        case 2:
            myURL = [NSURL URLWithString:@"http://infomaps.translink.ca/Public_Timetables/100/tt144.pdf"];
            break;
        case 3:
            myURL = [NSURL URLWithString:@"http://infomaps.translink.ca/Public_Timetables/100/tt145.pdf"];
            break;
        default:
            break;
    }
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    [_tableDisplay loadRequest:myRequest];
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

@end
