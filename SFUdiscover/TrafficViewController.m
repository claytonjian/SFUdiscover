//
//  TrafficViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/7/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "TrafficViewController.h"
#import "TFHpple.h"
#import "Tutorial.h"
#import "Contributor.h"

@interface TrafficViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TrafficViewController{
    NSArray *_objects;
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:(YES)];
}

- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:(YES)];
}

-(void)loadTutorials {
    // Obtain URL and HTML Data needed to parse
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.sfu.ca/security/sfuroadconditions/"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    // Set up parse
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
    // Prepare Parse if CAMPUS OPEN OR CLOSED
    NSString *tutorialsXpathQueryString = @"//div[@class='campus']";
    NSArray *LocationNode = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    tutorialsXpathQueryString = @"//div[@class='campus-status normal']/h1";
    NSArray *OCNode = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    // Prepare Parse BURNABY ROADS situation
    tutorialsXpathQueryString = @"//div[@class='status-title first']/h3";
    NSArray *tutorialsNodes1 = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    tutorialsXpathQueryString = @"//div[@class='status-title first']/h3/span";
    NSArray *tutorialsNodes2 = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    //Prepare Parse EXTRA WEATHER CONDITIONS
    tutorialsXpathQueryString = @"//div[@class='extra-weather-conditions last']/ul/li";
    NSArray *tutorialsNodes3 = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    //Prepare Parse ON OR OFF SCHEDULE
    tutorialsXpathQueryString = @"//div[@class='extra-weather-conditions last']/ul/li/span";
    NSArray *tutorialsNodes4 = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    // Create Array to hold parsed information
    NSMutableArray *newTutorials = [[NSMutableArray alloc] initWithCapacity:0];
    
    //Parse BURNABY OPEN OR CLOSED
    Tutorial *tutorial = [[Tutorial alloc] init];
    [newTutorials addObject:tutorial];
    tutorial.title = [NSString stringWithFormat:@"%@: %@",[[LocationNode[0] firstChild] content],[[OCNode[0] firstChild] content]];
    
    //Parse Burnaby Road followed by its condition (double loop)
    for (TFHppleElement *element in tutorialsNodes1) {
        for (TFHppleElement *element2 in tutorialsNodes2) {
        // 5
        Tutorial *tutorial = [[Tutorial alloc] init];
        [newTutorials addObject:tutorial];
        
        
        // 6
        tutorial.title = [NSString stringWithFormat:@"      %@%@",[[element firstChild] content],[[element2 firstChild] content]];
        NSLog(@"%@",tutorial.title);
        }
    }
    
    // Parse and diplay adjroads and its condition
    Tutorial *adjroads = [[Tutorial alloc] init];
    [newTutorials addObject:adjroads];
    adjroads.title = [NSString stringWithFormat:@"      %@%@",[[tutorialsNodes3[0] firstChild] content],[[tutorialsNodes4[0] firstChild] content]];
    
    // Parse and display classandexam schedule and its condition
    Tutorial *classandexam = [[Tutorial alloc] init];
    [newTutorials addObject:classandexam];
    classandexam.title = [NSString stringWithFormat:@"     %@%@",[[tutorialsNodes3[1] firstChild] content],[[tutorialsNodes4[1] firstChild] content]];
    
    // Parse and display translink schedule and its condition
    Tutorial *translink = [[Tutorial alloc] init];
    [newTutorials addObject:translink];
    translink.title = [NSString stringWithFormat:@"     %@%@",[[tutorialsNodes3[2] firstChild] content],[[tutorialsNodes4[2] firstChild] content]];
    
    // Put data into _objects to be displayed in cells
    _objects = newTutorials;
    [self.tableView reloadData];
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
    [self loadTutorials];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _objects.count;
}

// Function displays rows of information created by _objects in viewdidload in a tableview format
// Also checks if there is no more data to be displayed
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Tutorial *thisTutorial = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = thisTutorial.title;
    //cell.detailTextLabel.text = thisTutorial.url;
    
    return cell;
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
