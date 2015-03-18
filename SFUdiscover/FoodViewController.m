//
//  FoodViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/7/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//  Changes:
//  Other Editors:
//  Known Bugs:

#import "FoodViewController.h"

@interface FoodViewController ()

@property (weak, nonatomic) IBOutlet UITableView *locationTableView;

@end

@implementation FoodViewController {
    NSDictionary *LocationsDict;
    NSArray *LocationsArray;
}

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return LocationsDict.count;
}


// Use locations from plist file to be displayed in a table cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *current = [LocationsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = current;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Choose Location:";
}

// Load Food Locations from the plist file
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Locations" withExtension:@"plist"];
    LocationsDict = [NSDictionary dictionaryWithContentsOfURL:url];
    LocationsArray = LocationsDict.allKeys;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
// Identify the location pressed by used and prepare to send it
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *path = [self.locationTableView indexPathForSelectedRow];
    Food2ViewController *vc = [segue destinationViewController];
    vc.locationswitch = 	path.row;
}


@end