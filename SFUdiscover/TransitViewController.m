//
//  TransitViewController.m
//  Implementation file for the Transit View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, Yixuan Li
//
//  - Setup the menu for displaying transit information for SFU campus
//  - Provide the options for either bus stop selection or bus table display
//  - Show the bus information from user input of bus stop
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "TransitViewController.h"
#import "TFHpple.h"
#import "Tutorial.h"
#import "Contributor.h"

@interface TransitViewController (){
    int stop;
}
@property (weak, nonatomic) IBOutlet UIButton *transitToHome;
@property (weak, nonatomic) IBOutlet UILabel *busStop;
@property (weak, nonatomic) IBOutlet UITextView *busTime;
@property (weak, nonatomic) IBOutlet UILabel *busLabel;
@property (weak, nonatomic) IBOutlet UIButton *refresh;

@end

@implementation TransitViewController

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
    [_busTime setUserInteractionEnabled:NO];
    _mapButton.layer.borderWidth = .5f;
    _mapButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _busSchedButton.layer.borderWidth = .5f;
    _busSchedButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Create a TransitMapViewController and setup delegation

- (IBAction)openMap:(id)sender {
    TransitMapViewController *TMVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TransitMapViewController"];
    TMVC.TMVCDelegate = self;
    [self presentViewController:TMVC animated:YES completion:nil];
}

// Used for delegation to retrieve bus stop selection

- (void) passBack:(TransitMapViewController *)controller busStop:(NSString *)input number:(int) num{
    [self.busStop setText:input];
    stop = num;
    [self showInfo:num];
}

// Display bus information in real-time

-(void)showInfo:(int) num {
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://api.translink.ca/rttiapi/v1/stops/%i/estimates?apikey=3Y9GQyzgF2Iz2sBTICc2&count=3&timeframe=120",num];
    NSURL *myurl = [NSURL URLWithString:urlString];
    NSData *HtmlData = [NSData dataWithContentsOfURL:myurl];
    
    TFHpple *Parser = [TFHpple hppleWithHTMLData:HtmlData];
    NSMutableString *infoDisplay = [[NSMutableString alloc]init];
    
    TFHppleElement *times;
    NSString *temp;
    NSArray *buses = [Parser searchWithXPathQuery:@"//nextbus"];
    for (TFHppleElement *item in buses) {
        [infoDisplay appendString:(((TFHppleElement *)item.children[0]).content)];
        [infoDisplay appendString:@"        "];
        times = item.children[4];
        for (int i = 0; i < times.children.count; i++){
            temp = ((TFHppleElement *)((TFHppleElement *)times.children[i]).children[2]).content;
            [infoDisplay appendString:([temp componentsSeparatedByString:@" "][0])];
            [infoDisplay appendString:@" "];
        }
        [infoDisplay appendString:@"\n"];
    }
    
    self.busTime.text = infoDisplay;
    self.busLabel.hidden = FALSE;
    self.refresh.hidden = FALSE;
    
}

// Refreshes the bus time for current location

- (IBAction)refresh:(id)sender{
    [self showInfo:stop];
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
