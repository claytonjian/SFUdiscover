//
//  LostandFoundViewController.m
//  SFUdiscover
//
//  Created by James Voong on 3/5/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "LostandFoundViewController.h"
#import "LostandFoundWebViewController.h"

@interface LostandFoundViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *LostandFoundWeb;


- (IBAction)Search:(id)sender;
- (IBAction)Report:(id)sender;
- (IBAction)ViewAll:(id)sender;

@end

@implementation LostandFoundViewController


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    LostandFoundWebViewController *vc = [segue destinationViewController];
    if([[segue identifier] isEqualToString:@"SearchSegue"]){
        vc.passedString = @"Search";
    }
    
    if([[segue identifier] isEqualToString:@"ViewAllSegue"]){
        vc.passedString = @"ViewAll";
    }
    
    if([[segue identifier] isEqualToString:@"ReportSegue"]){
        vc.passedString = @"Report";
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller
}


@end
