//
//  BookStoreViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/5/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "BookStoreViewController.h"

@interface BookStoreViewController ()

@end

@implementation BookStoreViewController

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
    _browseMercButton.layer.borderWidth = .5f;
    _browseMercButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _courseMatButton.layer.borderWidth = .5f;
    _courseMatButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
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
