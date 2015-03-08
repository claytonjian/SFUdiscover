//
//  FeedbackViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()
@property (weak, nonatomic) IBOutlet UIButton *feedbackToHome;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation FeedbackViewController
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
- (IBAction)sendToSFU:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}
- (IBAction)sendToRestauants:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}

- (IBAction)sendToLibrary:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}

- (IBAction)sendToDevs:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}

//dimiss keyboard upon touching blank spaces on screen
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
