//
//  NewsFeedViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NewsFeedViewController.h"

@interface NewsFeedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *newsFeedToHome;


@end

@implementation NewsFeedViewController
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
    
    // Make self the delegate and datasource of the table view
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Remove lines between cells
    self.tableView.separatorColor = [UIColor clearColor];
    
    [self getFacebookFeed];
    
    // Load data
    [self.tableView reloadData];
    
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

- (void) getFacebookFeed{
    FBRequestConnection *fbConnection = [FBRequestConnection startWithGraphPath:@"simonfraseruniversity/feed?fields=message,link" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // Sucess! Include your code to handle the results here
            NSLog(@"user events: %@", result);
        } else {
            // An error occurred, we need to handle the error
            // See: https://developers.facebook.com/docs/ios/errors
        } }];
    
    if (fbConnection == nil){
        NSLog(@"nil fb connection");
    }else{
        NSLog(@"successful");
        NSLog(@"request: %@", fbConnection.urlRequest);
        NSLog(@"response: %@", fbConnection.urlResponse);
    }
    
}

#pragma mark - UITableView Delegate and Datasource method implementation

// Get the number of rows needed
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger count = 3;
    
    // return number of events
    return count;
}

// Displace cell content
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsFeedCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCardCell"];
    cell.nameLabel.text = @"Bonnie Ha";
    cell.timeLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row ];

    cell.messageText.text = @"kja;lsjkdf;lajkskdlfkj;alsjdflkjasdlfjals;dfjlaksjdflkjasdlfkjlasjdflkajsdlfj;alskdjksddssfddklksklaslkdfja;lksdjflakjsdf";
    
    

    
    return cell;
}

@end
