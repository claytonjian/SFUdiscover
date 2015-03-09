//
//  ViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIAlertView *SFUalert = [[UIAlertView alloc] initWithTitle:@"SFU Alert" message:@"The apocolypse as we know it is upon us. Run for your dear lives." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil];
    [SFUalert show];
	
    _canvasButton.layer.borderWidth = .5f;
    _canvasButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _connectButton.layer.borderWidth = .5f;
    _connectButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _feedbackButton.layer.borderWidth = .5f;
    _feedbackButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _calendarButton.layer.borderWidth = .5f;
    _calendarButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _navButton.layer.borderWidth = .5f;
    _navButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _transitButton.layer.borderWidth = .5f;
    _transitButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _loyaltyButton.layer.borderWidth = .5f;
    _loyaltyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _nfButton.layer.borderWidth = .5f;
    _nfButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _serviceButton.layer.borderWidth = .5f;
    _serviceButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _libButton.layer.borderWidth = .5f;
    _libButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
