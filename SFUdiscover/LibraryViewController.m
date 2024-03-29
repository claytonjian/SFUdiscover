//
//  LibraryViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2/28/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "LibraryViewController.h"

@interface LibraryViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *LibrarySite;

@end

@implementation LibraryViewController
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
    NSURL *myURL = [NSURL URLWithString:@"http://www.lib.sfu.ca/m?device=mobile"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    [_LibrarySite loadRequest:myRequest];

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
