//
//  NavigationViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *navigationToHome;

@end

@implementation NavigationViewController


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
- (void)viewBurnabyCampus {
    MKCoordinateRegion SFUBurnaby;
    SFUBurnaby.center.latitude = 49.277777;
    SFUBurnaby.center.longitude = -122.917777;
    SFUBurnaby.span.latitudeDelta = 0.0225;
    SFUBurnaby.span.longitudeDelta = 0.0225;
    [self.navigationMapView setRegion:SFUBurnaby animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self viewBurnabyCampus];
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
