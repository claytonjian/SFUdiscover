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
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;

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

- (IBAction)sendToLib:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}
- (IBAction)sendToRests:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}
- (IBAction)sendToDevs:(id)sender {
    //dismiss keyboard upon touch
    [self.inputField resignFirstResponder];
}

//dimiss keyboard upon touching blank spaces on screen
//this does not work right now for scroll views, normal views work
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

/*
//function disabled since user may want to type in multiple lines in 
 the text field and use return key to seprate lines
 
//dismiss keyboard when user hits return  (done)
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 480)];
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