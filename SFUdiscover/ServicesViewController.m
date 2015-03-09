//
//  ServicesViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "ServicesViewController.h"

@interface ServicesViewController ()
@property (weak, nonatomic) IBOutlet UIButton *servicesToHome;

@end

@implementation ServicesViewController
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
    _bookstoreButton.layer.borderWidth = .5f;
    _bookstoreButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _lostFoundButton.layer.borderWidth = .5f;
    _lostFoundButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _emergencyButton.layer.borderWidth = .5f;
    _emergencyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _safeWalkButton.layer.borderWidth = .5f;
    _safeWalkButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _restaurantButton.layer.borderWidth = .5f;
    _restaurantButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _trafficButton.layer.borderWidth = .5f;
    _trafficButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
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
