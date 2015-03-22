//
//  SelectCalendarViewController.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "SelectCalendarViewController.h"
#import "AppDelegate.h"

@interface SelectCalendarViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation SelectCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Make self the delegate and datasource of the table view
    self.calendarTableView.delegate = self;
    self.calendarTableView.dataSource = self;
    
    // Instantiate the appDelegate property, so we can access its eventManager property
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self loadCalendars];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadCalendars {
    
    [self.calendarTableView reloadData];
    
}

@end
