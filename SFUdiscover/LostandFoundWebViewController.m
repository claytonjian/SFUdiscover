//
//  LostandFoundWebViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/15/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "LostandFoundWebViewController.h"

@interface LostandFoundWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *LFWebPage;

@end

@implementation LostandFoundWebViewController
@synthesize passedString;

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
    NSLog(@"%@",passedString);
    NSURL *url;
    if([passedString isEqualToString:@"Search"]){
        url = [NSURL URLWithString:@"http://www.sfu.ca/srs/security/patrol-operations/programs/lost-and-found/search-for-an-item.html?keepThis=true&TB_iframe=true&height=700&width=700"];
        NSURLRequest *myRequest = [NSURLRequest requestWithURL:url];
        [_LFWebPage loadRequest:myRequest];
    }
    if([passedString isEqualToString:@"ViewAll"]){
        url = [NSURL URLWithString:@"http://www.sfu.ca/srs/security/patrol-operations/programs/lost-and-found/found-items.html?keepThis=true&TB_iframe=true&height=700&width=700"];
        NSURLRequest *myRequest = [NSURLRequest requestWithURL:url];
        [_LFWebPage loadRequest:myRequest];
    }
    if([passedString isEqualToString:@"Report"]){
        url = [NSURL URLWithString:@"http://www.sfu.ca/srs/security/patrol-operations/programs/lost-and-found/report-lost-item.html?keepThis=true&TB_iframe=true&height=700&width=700"];
        NSURLRequest *myRequest = [NSURLRequest requestWithURL:url];
        [_LFWebPage loadRequest:myRequest];
    }
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
