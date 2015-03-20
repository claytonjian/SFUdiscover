//
//  HomeViewController.m
//  Implementation file of the Home View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, Yixuan Li
//
//  - Setup user login mechanism
//  - Barred user from using Canvas and Connect functions if not logged in
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "HomeViewController.h"
#import "JNKeychain.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *logout;
@property (weak, nonatomic) IBOutlet UIWebView *logoffWebView;

@end

@implementation HomeViewController

// Create the login screen

- (IBAction)loginPressed:(id)sender {
    UserLoginViewController *log = [self.storyboard instantiateViewControllerWithIdentifier:@"UserLoginViewController"];
    log.delegate = self;
    [self presentViewController:log animated:YES completion:nil];
}

// Run when user login success
// Logout function becomes available

- (void)UserLoginDidFinish{
    self.login.hidden = TRUE;
    self.logout.hidden = FALSE;
}

// Delete user information from keychain
// Disconnect from CAS
// Login function becomes available

- (IBAction)logoutPressed:(id)sender {
    [kc deleteValueForKey:@"User"];
    [kc deleteValueForKey:@"Pass"];
    
    //Server logoff
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cas.sfu.ca/cas/logout"]];
    [_logoffWebView loadRequest:request];
    UIAlertView *logoff = [[UIAlertView alloc]initWithTitle:@"Logout" message:@"You have successfully logged out." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [logoff show];
    _login.hidden = FALSE;
    _logout.hidden = TRUE;
}

// Disallow user to access Canvas or Connect if not logged in

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"Canvas"] || [identifier isEqualToString:@"Connect"]) {
        if ([kc loadValueForKey:@"User"] == NULL){
            UIAlertView *loginRequired = [[UIAlertView alloc]initWithTitle:@"Error" message:@"This function require user authentication.\nPlease log in first." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
            [loginRequired show];
            return NO;
        }
        else
            return YES;
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIAlertView *SFUalert = [[UIAlertView alloc] initWithTitle:@"SFU Alert" message:@"The apocolypse as we know it is upon us. Run for your dear lives." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil];
    [SFUalert show];
    kc = [[JNKeychain alloc]init];
	
    _canvasButton.layer.borderWidth = .5f;
    _canvasButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _connectButton.layer.borderWidth = .5f;
    _connectButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _feedbackButton.layer.borderWidth = .5f;
    _feedbackButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _calendarButton.layer.borderWidth = .5f;
    _calendarButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _navButton.layer.borderWidth = .5f;
    _navButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _transitButton.layer.borderWidth = .5f;
    _transitButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _loyaltyButton.layer.borderWidth = .5f;
    _loyaltyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _nfButton.layer.borderWidth = .5f;
    _nfButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _serviceButton.layer.borderWidth = .5f;
    _serviceButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _libButton.layer.borderWidth = .5f;
    _libButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
