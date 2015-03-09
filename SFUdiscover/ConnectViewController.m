//
//  ConnectViewController.m
//  Implementation file for the Connect View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, James Voong, Yixuan Li
//
//  - Display the SFU Connect for user to use through cas.sfu
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "ConnectViewController.h"

@interface ConnectViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *SFUConnect;
@property (weak, nonatomic) IBOutlet UIButton *connectToHome;

@end

@implementation ConnectViewController
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
    // To-Do: Secure storage of user login information
    // Create SFU Connect for user
    NSURL *myURL = [NSURL URLWithString:@"https://cas.sfu.ca/cas/login?app=SFU+Connect&allow=sfu,zimbra&service=https%3A%2F%2Fconnect.sfu.ca%2Fzimbra%2Fpublic%2Fpreauth.jsp"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    [_SFUConnect loadRequest:myRequest];
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
