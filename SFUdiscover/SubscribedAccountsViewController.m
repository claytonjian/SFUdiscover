//
//  SubscribedAccountsViewController.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "SubscribedAccountsViewController.h"
#import "AppDelegate.h"

@interface SubscribedAccountsViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;


@end

@implementation SubscribedAccountsViewController

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
    
    // Make self the delegate and datasource of the table view
    self.tableAccounts.delegate = self;
    self.tableAccounts.dataSource = self;
    
    // Instantiate the appDelegate property, so we can access its eventManager property
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Get list of subscribed accounts
    [self getSubscribedAccounts];
    
    [self loadSubscribedAccounts];
    
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

-(void)loadSubscribedAccounts
{
    [self.tableAccounts reloadData];
}

-(void)getSubscribedAccounts
{
    self.arrSubscribedAccounts = @[@"simonfraseruniversity", @"SFUSurrey", @"SFUVancouver"];
}

#pragma mark - UITableView Delegate and Datasource method implementation

// Get the number of rows needed
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    // return number of events
    return self.arrSubscribedAccounts.count;
}

// Displace cell content
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellSubscribedAccounts"];
    
    NSString *accountName = [self.arrSubscribedAccounts objectAtIndex:indexPath.row];
    
    // Set the cell's text label
    cell.textLabel.text = accountName;
    
    return cell;
}



@end
