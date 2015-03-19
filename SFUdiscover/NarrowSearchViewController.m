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
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.prefs = [NSUserDefaults standardUserDefaults];
    self.favorites = [self.prefs mutableArrayValueForKey:@"favorites"];
    self.recents = [self.prefs mutableArrayValueForKey:@"recents"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([self.tableSelected isEqualToString:@"Favorites"]){
        return [self.favorites count];
    }
    else{
        return [self.recents count];
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
    else {
        cell.textLabel.text = [self.recents objectAtIndex:([self.recents count] - indexPath.row - 1)];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tableSelected isEqualToString:@"Favorites"]) {
        self.selectedLocation = [self.favorites objectAtIndex:indexPath.row];
    }
    else{
        self.selectedLocation = [self.recents objectAtIndex:indexPath.row];
    }
    [self performSegueWithIdentifier:@"ShowLocation" sender:self];
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
