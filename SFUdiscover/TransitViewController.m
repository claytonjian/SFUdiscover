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
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "TransitViewController.h"

@interface TransitViewController ()
@property (weak, nonatomic) IBOutlet UIButton *transitToHome;
@property (weak, nonatomic) IBOutlet UILabel *busStop;

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

- (void) passBack:(TransitMapViewController *)controller busStop:(NSString *)input{
    [self.busStop setText:input];
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
