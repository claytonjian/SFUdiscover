//
//  Food2ViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/7/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "Food2ViewController.h"

@interface Food2ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableDisplay;

@end

@implementation Food2ViewController {
    NSDictionary *RestaurantsDict;
    NSArray *RestaurantsArray;
}
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return RestaurantsDict.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *current = [RestaurantsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = current;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Choose Restaurant:";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url;
    switch (locationswitch) {
        case 0:
            url = [[NSBundle mainBundle] URLForResource:@"RL_Cornerstone" withExtension:@"plist"];
            NSLog(@"TEST0");
            break;
        case 1:
            url = [[NSBundle mainBundle] URLForResource:@"RL_MBC" withExtension:@"plist"];
            NSLog(@"TEST1");
            break;
        case 2:
            url = [[NSBundle mainBundle] URLForResource:@"RL_WMC" withExtension:@"plist"];
            NSLog(@"TEST2");
            break;
        default:
            NSLog(@"TEST3");
            break;
    }
    RestaurantsDict = [NSDictionary dictionaryWithContentsOfURL:url];
    RestaurantsArray = RestaurantsDict.allKeys;
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