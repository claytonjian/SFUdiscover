//
//  LibraryAskWebViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/7/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "LibraryAskWebViewController.h"

@interface LibraryAskWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *LibraryAsk;

@end

@implementation LibraryAskWebViewController

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
    NSURL *myURL = [NSURL URLWithString:@"http://www.lib.sfu.ca/help/ask-us/"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    [_LibraryAsk loadRequest:myRequest];
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