//
//  SafeWalkSiteViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/6/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "SafeWalkSiteViewController.h"

@interface SafeWalkSiteViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *SWWebPage;

@end

@implementation SafeWalkSiteViewController

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
    NSURL *myURL;
    myURL = [NSURL URLWithString:@"https://www.sfu.ca/srs/security/patrol-operations/programs/safe-walk.html"];
    NSLog(@"Test");
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    [_SWWebPage loadRequest:myRequest];}

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
