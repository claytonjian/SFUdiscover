//
//  Restaurants2ViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/6/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "Restaurants2ViewController.h"

@interface Restaurants2ViewController () {
    NSDictionary *RestaurantsDict;
    NSArray *RestaurantsArray;
}
@property (weak, nonatomic) IBOutlet UITableView *R2;
@end

@implementation Restaurants2ViewController
@synthesize locationswitch;

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
    NSURL *url;
    switch (locationswitch) {
        case 0:
            NSLog(@"TESTING");
            url = [[NSBundle mainBundle] URLForResource:@"RL_WMC" withExtension:@"plist"];
            break;
        case 1:
            url = [[NSBundle mainBundle] URLForResource:@"RL_MBC" withExtension:@"plist"];
            break;
        case 2:
            url = [[NSBundle mainBundle] URLForResource:@"RL_Cornerstone" withExtension:@"plist"];
            break;
        default:
            break;
    }
    RestaurantsDict = [NSDictionary dictionaryWithContentsOfURL:url];
    RestaurantsArray = RestaurantsDict.allKeys;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return RestaurantsDict.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"cell2"];
    cell2.textLabel.text = RestaurantsArray[indexPath.row];
    return cell2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Available Locations:";
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
