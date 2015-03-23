//
//  NarrowSearchViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 3/18/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NarrowSearchViewController.h"
#import "NavSearchResultsViewController.h"

@interface NarrowSearchViewController ()
@property (strong, nonatomic) NSMutableArray *favorites;
@property (strong, nonatomic) NSMutableArray *recents;
@property (strong, nonatomic) NSUserDefaults *prefs;
@property (weak, nonatomic) NSString *selectedLocation;
@property (weak, nonatomic) IBOutlet UITableView *locationDetails;

@end

@implementation NarrowSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)goBack:(id)sender {
    if([self.tableSelected isEqualToString:@"Restaurants"]){
        self.tableSelected = @"RestaurantLocs";
        [self.locationDetails reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.prefs = [NSUserDefaults standardUserDefaults];
    self.favorites = [self.prefs mutableArrayValueForKey:@"favorites"];
    self.recents = [self.prefs mutableArrayValueForKey:@"recents"];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [self.locationDetails reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if([self.tableSelected isEqualToString:@"Favorites"]){
        return @"Favorites";
    }
    else if ([self.tableSelected isEqualToString:@"Recent"]){
        return @"Recent";
    }
    else{
        return @"Restaurants";
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([self.tableSelected isEqualToString:@"Favorites"]){
        return [self.favorites count];
    }
    else if([self.tableSelected isEqualToString:@"Recent"]){
        return [self.recents count];
    }
    else if([self.tableSelected isEqualToString:@"RestaurantLocs"]){
        return [self.restaurantLocs count];
    }
    else{
        return [self.restaurants count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // writes the search option to each row
    static NSString *simpleTableIdentifier = @"showLocationDetail";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if ([self.tableSelected isEqualToString:@"Favorites"]) {
        cell.textLabel.text = [self.favorites objectAtIndex:indexPath.row];
    }
    else if ([self.tableSelected isEqualToString:@"Recent"]){
        cell.textLabel.text = [self.recents objectAtIndex:([self.recents count] - indexPath.row - 1)];
    }
    else if ([self.tableSelected isEqualToString:@"RestaurantLocs"]){
        cell.textLabel.text = [self.restaurantLocs objectAtIndex:indexPath.row];
    }
    else if([self.tableSelected isEqualToString:@"Restaurants"]){
        cell.textLabel.text = [self.restaurants objectAtIndex:indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tableSelected isEqualToString:@"Favorites"]) {
        self.selectedLocation = [self.favorites objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"ShowLocation" sender:self];
    }
    else if ([self.tableSelected isEqualToString:@"Recent"]){
        self.selectedLocation = [self.recents objectAtIndex:([self.recents count] - indexPath.row - 1)];
        [self performSegueWithIdentifier:@"ShowLocation" sender:self];
    }
    else if ([self.tableSelected isEqualToString:@"RestaurantLocs"]){
        self.tableSelected = @"Restaurants";
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
    }
    else if ([self.tableSelected isEqualToString:@"Restaurants"]){
        self.selectedLocation = [self.restaurants objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"ShowLocation" sender:self];
    }
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NavSearchResultsViewController *NSR = [segue destinationViewController];
    NSR.title = self.selectedLocation;
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
