//
//  TrafficHomeViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/7/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "TrafficHomeViewController.h"

@interface TrafficHomeViewController ()

@end

@implementation TrafficHomeViewController

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
    // button border/width
    _conditionButton.layer.borderWidth = .5f;
    _conditionButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _webcamButton.layer.borderWidth = .5f;
    _webcamButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
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
