//
//  CanvasViewController.m
//  Implementation file for the Canvas View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, James Voong, Yixuan Li
//
//  - Display the SFU Canvas for user to use through cas.sfu
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *SFUCanvas;
@property (weak, nonatomic) IBOutlet UIButton *canvasToHome;

@end

@implementation CanvasViewController

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
    // Create SFU Canvas for user
    NSURL *myURL = [NSURL URLWithString:@"https://canvas.sfu.ca"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    [_SFUCanvas loadRequest:myRequest];
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
