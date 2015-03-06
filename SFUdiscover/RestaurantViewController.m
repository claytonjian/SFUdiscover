//
//  RestaurantViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/6/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "RestaurantViewController.h"

@interface RestaurantViewController ()
@property (weak, nonatomic) IBOutlet UITableView *RLTableView;

@end

@implementation RestaurantViewController {
    NSDictionary *LocationsDict;
    NSArray *LocationsArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LocationsDict.count;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Locations" withExtension:@"plist"];
    LocationsDict = [NSDictionary dictionaryWithContentsOfURL:url];
    LocationsArray = LocationsDict.allKeys;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
        reuseIdentifier:@"cell"];
    cell.textLabel.text = LocationsArray[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Choose Location:";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
*/
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 NSIndexPath *path = [self.RLTableView indexPathForSelectedRow];
 Restaurants2ViewController *vc = [segue destinationViewController];
 vc.locationswitch = 	path.row;
 }

@end
