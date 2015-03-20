//
//  UserLoginViewController.m
//  Implementation file for the User Login View Controller
//
//  SFUdiscover
//
//  Created by Yixuan Li on 2015-03-10.
//  Contributors: Yixuan Li
//
//  - Log into CAS with given user credentials
//  - Store user credentials in apple keychain for secure storage
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "UserLoginViewController.h"

@interface UserLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@end

@implementation UserLoginViewController

@synthesize delegate;

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)goHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Dismiss keyboard upon selecting return key

- (BOOL)textFieldShouldReturn: (UITextField *) textField{
    [textField resignFirstResponder];
    return YES;
}

// Dismiss keyboard upon touching outside of keyboard

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

// Saves the user info in keychain and login to CAS with that info

- (IBAction)buttonPressed:(id)sender {
    keychain = [[JNKeychain alloc]init];
    if (_username.text.length > 0 && _password.text.length >0){
        [keychain saveValue:[_username text] forKey:@"User"];
        [keychain saveValue:[_password text] forKey:@"Pass"];
        // NEED TO CHECK INFORMATION WITH SERVER
        // CURRENTLY ONLY WORK WITH VALID USER
        NSString *enterUser = [NSString stringWithFormat:@"document.getElementById('username').value = '%@';",[_username text]];
        NSString *enterPass = [NSString stringWithFormat:@"document.getElementById('password').value = '%@';",[_password text]];
        [_webview stringByEvaluatingJavaScriptFromString:enterUser];
        [_webview stringByEvaluatingJavaScriptFromString:enterPass];
        [_webview stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('input')[6].click()"];
        UIAlertView *success = [[UIAlertView alloc]initWithTitle:@"Login" message: @"You have successfully logged in." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
        [success show];
        [self.delegate UserLoginDidFinish];
    }
    else{
        UIAlertView *failure = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Incorrect username or password.\nPlease try again." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [failure show];
    }
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}

// Edit alertview button actions to dismiss current view when action button seelected

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex != [alertView cancelButtonIndex]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.username.delegate = self;
    self.password.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://cas.sfu.ca/cas/login?"]];
    [_webview loadRequest:request];
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
