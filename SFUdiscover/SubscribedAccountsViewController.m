//
//  SubscribedAccountsViewController.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "SubscribedAccountsViewController.h"
#import "AppDelegate.h"
#import "TFHpple.h"
#import "SubscribedAccounts.h"

@interface SubscribedAccountsViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;


@end

@implementation SubscribedAccountsViewController

NSUInteger _selectedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)cancel:(id)sender {
    // Pop the current view controller from the navigation stack.
    [self.navigationController popViewControllerAnimated:YES];
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
    
    // Initialize variables
    _selectedIndex = 0;
    
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

-(void)loadSubscribedAccounts{
    
    self.arrSubscribedAccounts = [self getSubscribedAccounts];
    
    [self.tableAccounts reloadData];
}

-(NSArray *)getSubscribedAccounts
{
   
    // Parse for official SFU Facebook accounts
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.sfu.ca/dashboard/media/social-media-channels.html"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    NSString *tutorialsXpathQueryString = @"//table/tbody/tr/td/div/a[starts-with(@href, 'http://www.facebook.com')]";
    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    

    // Get the name of the account and link
    NSMutableArray *newTutorials = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in tutorialsNodes) {
       
        SubscribedAccounts *accounts = [[SubscribedAccounts alloc] init];
        [newTutorials addObject:accounts];
        accounts.url = [element objectForKey:@"href"];
        
        
        // Get the account name
        NSArray *urlParts = [accounts.url componentsSeparatedByString:@"/"];
        
        if([urlParts count] == 4){
            
            // Get the suffix of the url
            accounts.name = [urlParts lastObject];
            
        }else {
            
            // Get the account name of the url
            for (NSString* part in urlParts){
                if ([[part uppercaseString] containsString:@"SFU"] || [[part uppercaseString] containsString:@"SIMON" ]){
                    accounts.name = part;
                }
            }
        }
        
        
    }
    
    return newTutorials;
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
    
    SubscribedAccounts *accounts = [self.arrSubscribedAccounts objectAtIndex:indexPath.row];
    
    // Set the cell's text label
    cell.textLabel.text = accounts.name;
    cell.detailTextLabel.text = accounts.url;
    
    // If selected, display a check mark
    if (indexPath.row == _selectedIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Deselect the tapped row
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // If no row is selected, display no checkmark
    if (_selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:
                                 [NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Add a checkmark to the selected row
    _selectedIndex = indexPath.row;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
}



@end
