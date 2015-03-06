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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
