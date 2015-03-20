//
//  FeedbackViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//
//  Modified by Riku Kenju from 2015-02-28 onward
//  Version 1 implementation began 2015-02-28
//  Added UI elements - buttons
//  Added scroll view
//  Implemented dismiss keyboard function
//  Version 1 implemented on Mar 8th 2015 - display available feeback options

//  Version 2 implementation began 2015-03-09
//  Deleted input field - as per requiement change
//  Deleted associated functions with inut field
//  Added functions for mail compose view
//  Tested all buttons for bugs - no major issue found
//  Added label to display status message
//  Version 2 implemented 2015-03-15
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()
@property (weak, nonatomic) IBOutlet UIButton *feedbackToHome;
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;
@property (weak, nonatomic) IBOutlet UILabel *statusMessageLabel;

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
    
    //Initialize e-mail subject
    NSString *emailTitle = @"Test Email to SFU";
    //Initialize message body (this is empty)
    NSString *messageBody = @"test";
    //Initialize recipient
    NSArray *toRecipents = [NSArray arrayWithObject:@"rkenju@sfu.ca"];
    
    MFMailComposeViewController *composeView = [[MFMailComposeViewController alloc] init];
    composeView.mailComposeDelegate = self;
    [composeView setSubject:emailTitle];
    [composeView setMessageBody:messageBody isHTML:NO];
    [composeView setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:composeView animated:YES completion:NULL];
    
}

- (IBAction)sendToLib:(id)sender {
    
    //Initialize e-mail subject
    NSString *emailTitle = @"Test Email to Library";
    //Initialize message body (this is empty)
    NSString *messageBody = @"test";
    //Initialize recipient
    NSArray *toRecipents = [NSArray arrayWithObject:@"rkenju@sfu.ca"];
    
    MFMailComposeViewController *composeView = [[MFMailComposeViewController alloc] init];
    composeView.mailComposeDelegate = self;
    [composeView setSubject:emailTitle];
    [composeView setMessageBody:messageBody isHTML:NO];
    [composeView setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:composeView animated:YES completion:NULL];
    
}

- (IBAction)sendToDining:(id)sender {
    
    //Initialize e-mail subject
    NSString *emailTitle = @"Test Email to Dining";
    //Initialize message body (this is empty)
    NSString *messageBody = @"test";
    //Initialize recipient
    NSArray *toRecipents = [NSArray arrayWithObject:@"rkenju@sfu.ca"];
    
    MFMailComposeViewController *composeView = [[MFMailComposeViewController alloc] init];
    composeView.mailComposeDelegate = self;
    [composeView setSubject:emailTitle];
    [composeView setMessageBody:messageBody isHTML:NO];
    [composeView setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:composeView animated:YES completion:NULL];
}


- (IBAction)sendToDevs:(id)sender {
    
    //Initialize e-mail subject
    NSString *emailTitle = @"Test Email to Devs";
    //Initialize message body (this is empty)
    NSString *messageBody = @"test";
    //Initialize recipient
    NSArray *toRecipents = [NSArray arrayWithObject:@"rkenju@sfu.ca"];
    
    MFMailComposeViewController *composeView = [[MFMailComposeViewController alloc] init];
    composeView.mailComposeDelegate = self;
    [composeView setSubject:emailTitle];
    [composeView setMessageBody:messageBody isHTML:NO];
    [composeView setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:composeView animated:YES completion:NULL];
    
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //take corresponding action after sending mail
    //give user feedback on the result
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            [self.statusMessageLabel setText:@"Mail compose cancelled"];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            [self.statusMessageLabel setText:@"Draft saved"];
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent! - Your feeback is important to us :)");
            [self.statusMessageLabel setText:@"Mail sent!"];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            [self.statusMessageLabel setText:@"Mail compose cancelled"];
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //scroll view initialization
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 480)];
    
    //button formatting
    _sendToSFUButton.layer.borderWidth = .5f;
    _sendToSFUButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _sendToLibButton.layer.borderWidth = .5f;
    _sendToLibButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _sendToDiningButton.layer.borderWidth = .5f;
    _sendToDiningButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _sendToDevsButton.layer.borderWidth = .5f;
    _sendToDevsButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
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