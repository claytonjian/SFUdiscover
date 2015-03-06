//
//  BusScheduleViewController.m
//  SFUdiscover
//
//  Created by Yixuan Li on 3/5/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "BusScheduleViewController.h"

@interface BusScheduleViewController (){
    NSArray *buses;
}
@property (weak, nonatomic) IBOutlet UITableView *busTableView;
@property (weak, nonatomic) IBOutlet UIButton *transitGoHome;

@end

@implementation BusScheduleViewController

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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *current = [buses objectAtIndex:indexPath.row];
    cell.textLabel.text = current;
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    buses = [[NSArray alloc]initWithObjects:@"135",@"143",@"144",@"145", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *path = [self.busTableView indexPathForSelectedRow];
    BusTableViewController *vc = [segue destinationViewController];
    vc.busNumber = 	path.row;
}


@end
