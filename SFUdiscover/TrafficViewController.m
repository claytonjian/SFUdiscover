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

-(void)loadTutorials {
    // 1
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.sfu.ca/security/sfuroadconditions/"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    // 2
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
    // 3
    //NSString *tutorialsXpathQueryString = @"//div[@class='content-wrapper']/ul/li/a";
    NSString *tutorialsXpathQueryString = @"//div[@class='main-campus-info half last']/div";
    //NSString *tutorialsXpathQueryString = @"//div[@class='header-divider']";
    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    // 4
    NSMutableArray *newTutorials = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in tutorialsNodes) {
        // 5
        Tutorial *tutorial = [[Tutorial alloc] init];
        [newTutorials addObject:tutorial];
        
        
        // 6
        tutorial.title = [[element firstChild] content];
        NSLog(@"%@",tutorial.title);
        
        // 7
        //tutorial.url = [element objectForKey:@"href"];
    }
    
    // 8
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
